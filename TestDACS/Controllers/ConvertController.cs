using Microsoft.AspNetCore.Mvc;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace YourNamespace.Controllers
{
    public class ConvertController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult GetText([FromBody] TextDTO dto)
        {
            // Lấy văn bản từ dto
            string text = dto.Text;

            // Tạo hình ảnh từ văn bản
            using (Bitmap bitmap = new Bitmap(1, 1))
            {
                using (Graphics graphics = Graphics.FromImage(bitmap))
                {
                    Font font = new Font("Arial", 25, FontStyle.Regular, GraphicsUnit.Pixel);
                    SizeF textSize = graphics.MeasureString(text, font);
                    int width = (int)textSize.Width;
                    int height = (int)textSize.Height;
                    bitmap.Dispose();

                    // Tạo hình ảnh mới có kích thước dựa trên kích thước của văn bản
                    using (Bitmap newBitmap = new Bitmap(width, height))
                    {
                        using (Graphics newGraphics = Graphics.FromImage(newBitmap))
                        {
                            newGraphics.Clear(Color.White);
                            newGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                            newGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
                            newGraphics.DrawString(text, font, Brushes.Red, new PointF(0, 0)); // Thay đổi màu thành đỏ

                            // Lưu hình ảnh vào thư mục wwwroot/images
                            string fileName = Guid.NewGuid().ToString() + ".jpg";
                            string imagePath = Path.Combine("images", fileName);
                            string physicalPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", imagePath);

                            // Lưu hình ảnh vào thư mục wwwroot/images và trả về đường dẫn đến hình ảnh
                            newBitmap.Save(physicalPath, ImageFormat.Jpeg);
                            return Json("/" + imagePath);
                        }
                    }
                }
            }
        }
    }

    public class TextDTO
    {
        public string Text { get; set; }
    }
}
