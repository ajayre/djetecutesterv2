using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DJetronicStudio
{
    public partial class ImageViewerForm : Form
    {
        public Image DisplayImage
        {
            set
            {
                Picture.Image = value;
            }

            get
            {
                return Picture.Image;
            }
        }

        public string ImageTitle
        {
            set
            {
                Title.Text = value;
            }

            get
            {
                return Title.Text;
            }
        }

        public ImageViewerForm()
        {
            InitializeComponent();
        }
    }
}
