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

namespace DJetronicECUTester
{
    public partial class Gallery : UserControl
    {
        public string ImageFolder = null;

        public delegate void OnShowImageHandler(object sender, string FileName, Image image);
        public event OnShowImageHandler OnShowImage = null;

        private List<string> Images = new List<string>();

        public Gallery()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Called when control is shown or hidden
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Gallery_VisibleChanged(object sender, EventArgs e)
        {
            if (Visible)
            {
                LoadImages();
            }
        }

        /// <summary>
        /// Searches for and loads images into the display
        /// </summary>
        private void LoadImages
            (
            )
        {
            Images.Clear();

            if ((ImageFolder == null) || !Directory.Exists(ImageFolder))
            {
                return;
            }

            foreach (string File in Directory.EnumerateFiles(ImageFolder, "*.png"))
            {
                Images.Add(File);
            }

            int Index = 0;

            Size size = new Size(150, 150);
            int rows = 4;
            int columns = 4;
            int totalBoxes = rows * columns;
            int padding = 10;
            List<PictureBox> pictureBoxList = new List<PictureBox>();
            for (int row = 0; row < rows; row++)
            {
                if (Index >= Images.Count) continue;

                int currentY = (row * size.Height) + (padding * row);
                for (int col = 0; col < columns; col++)
                {
                    if (Index >= Images.Count) continue;

                    int currentX = (col * size.Width) + (padding * col);
                    PictureBox picture = new PictureBox
                    {
                        Name = "pictureBox" + (row + col),
                        Size = size,
                        Location = new Point(currentX, currentY),
                        BorderStyle = BorderStyle.FixedSingle,
                        SizeMode = PictureBoxSizeMode.Zoom,
                        Visible = true,
                        Image = Bitmap.FromFile(Images[Index]),
                        Tag = Images[Index++]
                    };
                    this.Controls.Add(picture);
                    pictureBoxList.Add(picture);
                    picture.MouseClick += Picture_MouseClick;
                }
            }
        }

        /// <summary>
        /// Called when an image is clicked on
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Picture_MouseClick(object sender, MouseEventArgs e)
        {
            PictureBox Picture = sender as PictureBox;

            if (OnShowImage != null)
            {
                OnShowImage(this, Picture.Tag as string, Picture.Image);
            }
        }
    }
}
