using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DJetronicStudio
{
    public class DataPoint
    {
        public double Timestamp;
        public Status Data;

        public DataPoint
            (
            double Timestamp,
            Status Data
            )
        {
            this.Timestamp = Timestamp;
            this.Data = Data;
        }
    }

    public class DataBuffer
    {
        public delegate void OnDataAddedHandler(object sender, int NumPoints, DataPoint NewPoint);
        public event OnDataAddedHandler OnDataAdded = null;

        public delegate void OnDataClearedHandler(object sender);
        public event OnDataClearedHandler OnDataCleared = null;

        public List<DataPoint> Points = new List<DataPoint>();

        public void Clear
            (
            )
        {
            Points.Clear();
            if (OnDataCleared != null) OnDataCleared(this);
        }

        public void Add
            (
            double Timestamp,
            Status Data
            )
        {
            DataPoint NewPoint = new DataPoint(Timestamp, Data);

            Points.Add(NewPoint);
            if (OnDataAdded != null) OnDataAdded(this, Points.Count, NewPoint);
        }

        /// <summary>
        /// Gets the newest data point
        /// </summary>
        /// <returns>Newest data point or null if buffer empty</returns>
        public DataPoint GetNewest
            (
            )
        {
            if (Points.Count == 0)
                return null;
            else
                return Points[Points.Count - 1];
        }

        /// <summary>
        /// Exports the buffer to a CSV file
        /// </summary>
        /// <param name="FileName">Path and name of CSV file to export to</param>
        public void ExportCSV
            (
            string FileName
            )
        {
            // fixme - to do
        }
    }
}
