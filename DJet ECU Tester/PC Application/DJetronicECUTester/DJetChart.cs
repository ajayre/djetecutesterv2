using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        private ObservableCollection<ISeries> Series { get; set; }

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

            Series = new ObservableCollection<ISeries> { };

            Chart.XAxes = new LiveChartsCore.Axis<SkiaSharpDrawingContext, LabelGeometry, LineGeometry>[]
            {
                new LiveChartsCore.SkiaSharpView.Axis
                {
                    TextSize = 12,
                    Name = "Time",
                    NameTextSize = 12,
                    Labeler = TimeLabeler
                }
            };

            Chart.YAxes = new Axis[]
            {
                new Axis
                {
                    TextSize = 12,
                    MinLimit = 0,
                    MaxLimit = 15
                }
            };

            Color SeriesColor = Color.Orange;

            LineSeries<ObservablePoint> NewSeries = new LineSeries<ObservablePoint>();
            NewSeries.Name = "Test";
            NewSeries.LineSmoothness = 0.0;
            NewSeries.Fill = null;
            NewSeries.GeometrySize = 3.0;
            NewSeries.GeometryStroke = new SolidColorPaint(new SKColor(SeriesColor.R, SeriesColor.G, SeriesColor.B, SeriesColor.A)) { StrokeThickness = 1.0F };
            NewSeries.Stroke = new SolidColorPaint(new SKColor(SeriesColor.R, SeriesColor.G, SeriesColor.B, SeriesColor.A)) { StrokeThickness = 1.0F };
            NewSeries.Values = new ObservableCollection<ObservablePoint>();
            Series.Add(NewSeries);

            Chart.Series = Series;
            Chart.AnimationsSpeed = TimeSpan.FromMilliseconds(300);
            Chart.EasingFunction = null;

            //((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[0].MinLimit = 0;
            //((CartesianChart<SkiaSharpDrawingContext>)Chart.CoreChart).YAxes[0].MaxLimit = 15;
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
            ((ObservableCollection<ObservablePoint>)Series[0].Values).Clear();
        }

        /// <summary>
        /// Called when data is inserted into the recording buffer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="NumPoints"></param>
        private void _Buffer_OnDataAdded(object sender, int NumPoints, DataPoint NewPoint)
        {
            ObservablePoint NewData = new ObservablePoint((int)(NewPoint.Timestamp), NewPoint.Data.PulseWidth_I / 1000.0);
            ((ObservableCollection<ObservablePoint>)Series[0].Values).Add(NewData);
        }
    }
}
