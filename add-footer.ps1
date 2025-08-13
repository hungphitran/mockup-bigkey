# Script thêm footer cho các trang khách hàng BigKey Tour

# Danh sách các trang khách hàng
$customerPages = @(
    "02-combo-results.html",
    "02-flight-results.html", 
    "02-hotel-results.html",
    "04-booking-payment.html",
    "05-combo-details.html",
    "06-flight-details.html",
    "07-hotel-details.html",
    "08-booking-success.html",
    "09-user-orders.html",
    "10-order-details.html",
    "14-notification-center.html",
    "15-help-support.html",
    "16-user-profile.html",
    "17-reviews-ratings.html",
    "18-error-pages.html"
)

# Nội dung footer
$footerContent = @'
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-main">
                <!-- Company Info -->
                <div class="footer-section">
                    <h3><i class="fas fa-key"></i> BigKey Tour</h3>
                    <p>Nền tảng du lịch toàn diện hàng đầu tại Việt Nam, kết nối khách hàng với những trải nghiệm du lịch tuyệt vời nhất.</p>
                    
                    <div class="footer-contact">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>123 Nguyễn Huệ, Quận 1, TP.HCM</span>
                    </div>
                    
                    <div class="footer-contact">
                        <i class="fas fa-phone"></i>
                        <span>Hotline: 1900 1234</span>
                    </div>
                    
                    <div class="footer-contact">
                        <i class="fas fa-envelope"></i>
                        <span>info@bigkeytour.vn</span>
                    </div>

                    <div class="footer-social">
                        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>
                        <a href="#" title="TikTok"><i class="fab fa-tiktok"></i></a>
                    </div>
                </div>

                <!-- Services -->
                <div class="footer-section">
                    <h3><i class="fas fa-concierge-bell"></i> Dịch vụ</h3>
                    <ul>
                        <li><a href="02-tour-results.html"><i class="fas fa-route"></i> Tour du lịch</a></li>
                        <li><a href="02-combo-results.html"><i class="fas fa-gift"></i> Tour combo</a></li>
                        <li><a href="02-flight-results.html"><i class="fas fa-plane"></i> Vé máy bay</a></li>
                        <li><a href="02-hotel-results.html"><i class="fas fa-hotel"></i> Khách sạn</a></li>
                        <li><a href="#"><i class="fas fa-car"></i> Thuê xe</a></li>
                        <li><a href="#"><i class="fas fa-utensils"></i> Nhà hàng</a></li>
                    </ul>
                </div>

                <!-- Support -->
                <div class="footer-section">
                    <h3><i class="fas fa-headset"></i> Hỗ trợ</h3>
                    <ul>
                        <li><a href="15-help-support.html"><i class="fas fa-question-circle"></i> Trung tâm hỗ trợ</a></li>
                        <li><a href="#"><i class="fas fa-file-contract"></i> Điều khoản sử dụng</a></li>
                        <li><a href="#"><i class="fas fa-shield-alt"></i> Chính sách bảo mật</a></li>
                        <li><a href="#"><i class="fas fa-undo-alt"></i> Chính sách hoàn hủy</a></li>
                        <li><a href="#"><i class="fas fa-credit-card"></i> Phương thức thanh toán</a></li>
                        <li><a href="14-notification-center.html"><i class="fas fa-bell"></i> Thông báo</a></li>
                    </ul>
                </div>

                <!-- Account -->
                <div class="footer-section">
                    <h3><i class="fas fa-user-circle"></i> Tài khoản</h3>
                    <ul>
                        <li><a href="09-user-orders.html"><i class="fas fa-shopping-bag"></i> Đơn hàng của tôi</a></li>
                        <li><a href="16-user-profile.html"><i class="fas fa-user"></i> Hồ sơ cá nhân</a></li>
                        <li><a href="17-reviews-ratings.html"><i class="fas fa-star"></i> Đánh giá & Nhận xét</a></li>
                        <li><a href="#"><i class="fas fa-gift"></i> Ưu đãi của tôi</a></li>
                        <li><a href="#"><i class="fas fa-coins"></i> Điểm thưởng</a></li>
                        <li><a href="partner-registration.html"><i class="fas fa-handshake"></i> Trở thành đối tác</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="footer-bottom-content">
                    <div>
                        <p>&copy; 2025 BigKey Tour. Tất cả quyền được bảo lưu.</p>
                    </div>
                    <div class="footer-links">
                        <a href="#">Điều khoản</a>
                        <a href="#">Bảo mật</a>
                        <a href="#">Cookies</a>
                        <a href="#">Sitemap</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
'@

$basePath = "C:\Users\hung\Downloads\tài liệu bigkey chính thức\basicdesign"

foreach ($page in $customerPages) {
    $filePath = Join-Path $basePath $page
    
    if (Test-Path $filePath) {
        Write-Host "Thêm footer vào $page..." -ForegroundColor Yellow
        
        # Đọc nội dung file
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # Thay thế </body></html> cuối file
        $newContent = $content -replace "</body>\s*</html>\s*$", "$footerContent`r`n</body>`r`n</html>"
        
        # Ghi lại file
        Set-Content $filePath -Value $newContent -Encoding UTF8
        
        Write-Host "✅ Hoàn thành $page" -ForegroundColor Green
    } else {
        Write-Host "❌ Không tìm thấy $page" -ForegroundColor Red
    }
}

Write-Host "🎉 Hoàn thành thêm footer cho tất cả trang khách hàng!" -ForegroundColor Cyan
