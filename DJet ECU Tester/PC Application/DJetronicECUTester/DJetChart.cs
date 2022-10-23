using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;
using System.Collections.ObjectModel;
using LiveChartsCore;
using LiveChartsCore.Kernel;
using LiveChartsCore.Kernel.Sketches;
using LiveChartsCore.Defaults;
using LiveChartsCore.Motion;
using LiveChartsCore.Measure;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore.SkiaSharpView.Painting;
using LiveChartsCore.SkiaSharpView.Drawing;
using LiveChartsCore.SkiaSharpView.SKCharts;
using LiveChartsCore.SkiaSharpView.Drawing.Geometries;
using LiveChartsCore.Drawing;
using SkiaSharp;
using SkiaSharp.Internals;

namespace DJetronicStudio
{
    public partial class DJetChart : UserControl
    {
        private class SeriesDescription
        {
            public string Name;
            public CheckBox CheckBox;
            public Color LineColor;

            public SeriesDescription
                (
                string Name,
                CheckBox CheckBox,
                Color LineColor
                )
            {
                this.Name = Name;
                this.CheckBox = CheckBox;
                this.LineColor = LineColor;
            }
        };

        private const int NUM_SERIES = 11;

        private SeriesDescription[] SeriesDescriptions;
        private ObservableCollection<ISeries> Series { get; set; }
        private ChartSettings Settings = new ChartSettings();

        private enum SeriesIndices
        {
            PulseWidthI = 0,
            PulseWidthII = 1,
            PulseWidthIII = 2,
            PulseWidthIV = 3,
            FuelPump = 4,
            EngineSpeed = 5,
            Throttle = 6,
            CoolantTemperature = 7,
            AirTemperature = 8,
            Vacuum = 9,
            StarterMotor = 10
        };

        private DataBuffer _Buffer;
        public DataBuffer Buffer
        {
            get { return _Buffer; }
            set
            {
                _Buffer = value;
                if (_Buffer != null)
                {
                    _Buffer.OnDataAdded += _Buffer_OnDataAdded;
                    _Buffer.OnDataCleared += _Buffer_OnDataCleared;
                }
            }
        }

        public DJetChart()
        {
            InitializeComponent();

            SeriesDescriptions = new SeriesDescription[]
            {
                new SeriesDescription("Pulse Width I",       PulseWidthIInput,   Color.Orange),
                new SeriesDescription("Pulse Width II",      PulseWidthIIInput,  Color.Red),
                new SeriesDescription("Pulse Width III",     PulseWidthIIIInput, Color.Blue),
                new SeriesDescription("Pulse Widtn IV",      PulseWidthIVInput,  Color.Purple),
                new SeriesDescription("Fuel Pump",           FuelPumpInput,      Color.Green),
                new SeriesDescription("Engine Speed",        EngineSpeedInput,   Color.Magenta),
                new SeriesDescription("Throttle",            ThrottleInput,      Color.Cyan),
                new SeriesDescription("Coolant Temperature", CoolantTempInput,   Color.HotPink),
                new SeriesDescription("Air Temperature",     AirTempInput,       Color.Violet),
                new SeriesDescription("Vacuum",              VacuumInput,        Color.SlateBlue),
                new SeriesDescription("Starter Motor",       StarterMotorInput,  Color.SandyBrown)
            };

        Series = new ObservableCollection<ISeries> { };

            Chart.XAxes = new LiveChartsCore.Axis<SkiaSharpDrawingContext, LabelGeometry, LineGeometry>[]
            {
                new LiveChartsCore.SkiaSharpView.Axis
                {
                    TextSize = 12,
                    Name = "Time",
                    NameTextSize = 16,
                    Labeler = TimeLabeler
                }
            };

            Chart.YAxes = new Axis[]
            {
                new Axis
                {
                    TextSize = 12,
                    MinLimit = Settings.MinY,
                    MaxLimit = Settings.MaxY,
                    NameTextSize = 16,
                    Name = Settings.YAxisTitle,
                    Position = AxisPosition.Start,
                    NamePaint = new SolidColorPaint(new SKColor(Settings.YColor.R, Settings.YColor.G, Settings.YColor.B, Settings.YColor.A)),
                    LabelsPaint = new SolidColorPaint(new SKColor(Settings.YColor.R, Settings.YColor.G, Settings.YColor.B, Settings.YColor.A))
                },

                new Axis
                {
                    TextSize = 12,
                    MinLimit = Settings.SecondYAxisMin,
                    MaxLimit = Settings.SecondYAxisMax,
                    NameTextSize = 16,
                    Name = Settings.SecondYAxisTitle,
                    Position = AxisPosition.End,
                    NamePaint = new SolidColorPaint(new SKColor(Settings.SecondYAxisColor.R, Settings.SecondYAxisColor.G, Settings.SecondYAxisColor.B, Settings.SecondYAxisColor.A)),
                    LabelsPaint = new SolidColorPaint(new SKColor(Settings.SecondYAxisColor.R, Settings.SecondYAxisColor.G, Settings.SecondYAxisColor.B, Settings.SecondYAxisColor.A)),
                    IsVisible = Settings.EnableSecondYAxis
                }
            };

            for (int Ser = 0; Ser < NUM_SERIES; Ser++)
            {
                Color LineColor = SeriesDescriptions[Ser].LineColor;

                LineSeries<ObservablePoint> NewSeries = new LineSeries<ObservablePoint>();
                NewSeries.Name = SeriesDescriptions[Ser].Name;
                NewSeries.LineSmoothness = 0.0;
                NewSeries.Fill = null;
                NewSeries.GeometrySize = 3.0;
                NewSeries.GeometryStroke = new SolidColorPaint(new SKColor(LineColor.R, LineColor.G, LineColor.B, LineColor.A)) { StrokeThickness = 1.0F };
                NewSeries.Stroke = new SolidColorPaint(new SKColor(LineColor.R, LineColor.G, LineColor.B, LineColor.A)) { StrokeThickness = 1.0F };
                NewSeries.Values = new ObservableCollection<ObservablePoint>();
                SeriesDescriptions[Ser].CheckBox.Tag = NewSeries;
                Series.Add(NewSeries);
            }

            Chart.Series = Series;
            Chart.AnimationsSpeed = TimeSpan.FromMilliseconds(300);
            Chart.EasingFunction = null;

            //MotionCanvas<SkiaSharpDrawingContext> Canvas = Chart.CoreCanvas;
            //IPaint<SkiaSharpDrawingContext> TitleLabel = new SolidColorPaint(new SKColor(0, 0, 0)) { ZIndex = int.MaxValue - 1 };
            //LabelGeometry LabelGeom = new LabelGeometry { X = 0, Y = 30, Text = "Chart Title", TextSize = 16 };
            //LabelGeom.X = (Chart.Width - LabelGeom.Measure(TitleLabel).Width) / 2;
            //TitleLabel.AddGeometryToPaintTask(Canvas, LabelGeom);
            //Canvas.AddDrawableTask(TitleLabel);
        }

        /// <summary>
        /// Applies the current settings to the chart
        /// </summary>
        private void ApplySettings
            (
            )
        {
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[0].MinLimit = Settings.MinY;
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[0].MaxLimit = Settings.MaxY;
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[0].Name = Settings.YAxisTitle;

            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[1].MinLimit = Settings.SecondYAxisMin;
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[1].MaxLimit = Settings.SecondYAxisMax;
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[1].Name = Settings.SecondYAxisTitle;
            ((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[1].IsVisible = Settings.EnableSecondYAxis;

            foreach (ISeries Ser in Series)
            {
                LineSeries<ObservablePoint> SerObj = Ser as LineSeries<ObservablePoint>;

                if ((SerObj.Name == "Pulse Width I") && Settings.SecondYAxisShowPulseWidthI && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Pulse Width II") && Settings.SecondYAxisShowPulseWidthII && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Pulse Width III") && Settings.SecondYAxisShowPulseWidthIII && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Pulse Width IV") && Settings.SecondYAxisShowPulseWidthIV && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Fuel Pump") && Settings.SecondYAxisShowFuelPump && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Engine Speed") && Settings.SecondYAxisShowEngineSpeed && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Throttle") && Settings.SecondYAxisShowThrottle && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Coolant Temperature") && Settings.SecondYAxisShowCoolantTemperature && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Air Temperature") && Settings.SecondYAxisShowAirTemperature && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Vacuum") && Settings.SecondYAxisShowVacuum && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;

                if ((SerObj.Name == "Starter Motor") && Settings.SecondYAxisShowStaterMotor && Settings.EnableSecondYAxis)
                    SerObj.ScalesYAt = 1;
                else
                    SerObj.ScalesYAt = 0;
            }
        }

        /// <summary>
        /// Formats the time labels
        /// </summary>
        /// <param name="Value">Time in milliseconds</param>
        /// <returns>Formatted time</returns>
        private string TimeLabeler
            (
            double Value
            )
        {
            if (Value >= 1000)
            {
                return (Value / 1000).ToString("N1") + "s";
            }

            return Value.ToString("N0") + "ms";
        }

        /// <summary>
        /// Called when the recording buffer is emptied
        /// </summary>
        /// <param name="sender"></param>
        private void _Buffer_OnDataCleared(object sender)
        {
            Clear();
        }

        /// <summary>
        /// Called when data is inserted into the recording buffer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="NumPoints"></param>
        private void _Buffer_OnDataAdded(object sender, int NumPoints, DataPoint NewPoint)
        {
            if (SeriesDescriptions[(int)SeriesIndices.PulseWidthI].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.PulseWidth_I / 1000.0);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.PulseWidthI].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.PulseWidthII].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.PulseWidth_II / 1000.0);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.PulseWidthII].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.PulseWidthIII].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.PulseWidth_III / 1000.0);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.PulseWidthIII].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.PulseWidthIV].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.PulseWidth_IV / 1000.0);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.PulseWidthIV].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.FuelPump].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.FuelPumpOn ? 0 : 12);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.FuelPump].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.EngineSpeed].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.EngineSpeed);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.EngineSpeed].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.CoolantTemperature].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.CoolantTemperature);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.CoolantTemperature].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.AirTemperature].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.AirTemperature);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.AirTemperature].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.Vacuum].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.Vacuum);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.Vacuum].Values).Add(NewData);
            }

            if (SeriesDescriptions[(int)SeriesIndices.StarterMotor].CheckBox.Checked)
            {
                ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.StarterMotorOn ? 12 : 0);
                ((ObservableCollection<ObservablePoint>)Series[(int)SeriesIndices.StarterMotor].Values).Add(NewData);
            }
        }

        /// <summary>
        /// Clears data from the chart
        /// </summary>
        private void Clear
            (
            )
        {
            for (int Ser = 0; Ser < NUM_SERIES; Ser++)
            {
                ((ObservableCollection<ObservablePoint>)Series[Ser].Values).Clear();
            }
        }

        /// <summary>
        /// Called when user clicks on the clear button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ClearBtn_Click(object sender, EventArgs e)
        {
            Clear();
        }

        /// <summary>
        /// Exports the chart as an image
        /// </summary>
        private void ExportImage
            (
            )
        {
            if (ExportImageDialog.ShowDialog() == DialogResult.OK)
            {
                var Ch = new SKCartesianChart(Chart);
                var Img = Ch.GetImage();

                SKEncodedImageFormat Format = SKEncodedImageFormat.Png;
                string Ext = Path.GetExtension(ExportImageDialog.FileName);
                if (Ext == ".gif") Format = SKEncodedImageFormat.Gif;
                else if (Ext == ".bmp") Format = SKEncodedImageFormat.Bmp;
                else if (Ext == ".jpg") Format = SKEncodedImageFormat.Jpeg;
                else if (Ext == ".jpeg") Format = SKEncodedImageFormat.Jpeg;

                Ch.SaveImage(ExportImageDialog.FileName, Format);
            }
        }

        /// <summary>
        /// Called when user clicks on the button to export the chart as an image
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ExportImageBtn_Click(object sender, EventArgs e)
        {
            ExportImage();
        }

        /// <summary>
        /// Edits the chart settings
        /// </summary>
        private void EditSettings
            (
            )
        {
            ChartSettingsForm SettingsForm = new ChartSettingsForm();
            SettingsForm.Settings = Settings;

            if (SettingsForm.ShowDialog() == DialogResult.OK)
            {
                Settings = SettingsForm.Settings;
                ApplySettings();
            }
        }

        /// <summary>
        /// Called when the user clicks on the button to edit the chart settings
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SettingsBtn_Click(object sender, EventArgs e)
        {
            EditSettings();
        }
    }
}
