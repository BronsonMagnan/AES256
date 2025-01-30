# Generate a secure AES-256 key (change this and store it securely)
$key = New-Object byte[] 32  # 256-bit key (32 bytes)
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($key)
$keyBase64 = [Convert]::ToBase64String($key) # Save this securely!

# Generate an IV (Initialization Vector)
$iv = New-Object byte[] 16  # 128-bit IV (16 bytes)
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($iv)
$ivBase64 = [Convert]::ToBase64String($iv) # Save this securely!

# Password to encrypt
$password = "<place password to encrypt here>"

# Encrypt using AES-256
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key
$aes.IV = $iv
$encryptor = $aes.CreateEncryptor()
$plainBytes = [System.Text.Encoding]::UTF8.GetBytes($password)
$encryptedBytes = $encryptor.TransformFinalBlock($plainBytes, 0, $plainBytes.Length)
$encryptedBase64 = [Convert]::ToBase64String($encryptedBytes)

Write-Host "`n🔑 AES Key (store securely!): $keyBase64"
Write-Host "🛑 AES IV (store securely!): $ivBase64"
Write-Host "🔒 Encrypted Password: $encryptedBase64"

