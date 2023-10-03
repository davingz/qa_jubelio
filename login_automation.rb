require 'selenium-webdriver'

# Inisialisasi WebDriver untuk Chrome
driver = Selenium::WebDriver.for :chrome

begin
  # Buka halaman login Jubelio
  driver.get 'https://app.jubelio.com/login'

  # Temukan elemen input email dan masukkan email
  email_input = driver.find_element(xpath: "//input[@name='email']")
  email_input.send_keys 'qa.rakamin.jubelio@gmail.com'

  # Temukan elemen input password dan masukkan kata sandi
  password_input = driver.find_element(xpath: "//input[@name='password']")
  password_input.send_keys 'Jubelio123!'

  # Temukan tombol "Masuk" berdasarkan atribut class
  login_button = driver.find_element(xpath: "//button[@class='ladda-button btn btn-primary block full-width mb-4']")
  login_button.click

  # Tunggu hingga halaman login selesai dimuat (Anda mungkin perlu menyesuaikan waktu menunggu)
  sleep(5)

  # Verifikasi bahwa Anda berhasil login dengan memeriksa URL atau elemen di halaman selanjutnya
  if driver.current_url == 'https://app.jubelio.com/dashboard'
    puts 'Login berhasil!'
  else
    puts 'Login gagal!'
  end
rescue StandardError => e
  puts "Terjadi kesalahan: #{e.message}"
end

# Tutup browser
driver.quit
