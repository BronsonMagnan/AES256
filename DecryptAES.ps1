# Prompt for AES key and IV
$keyBase64 = Read-Host "Enter AES Key"
$ivBase64 = Read-Host "Enter AES IV"

# Convert key and IV back to byte arrays
$key = [Convert]::FromBase64String($keyBase64)
$iv = [Convert]::FromBase64String($ivBase64)

# Encrypted password (replace this with the generated encrypted string)
$encryptedBase64 = "PASTE_ENCRYPTED_PASSWORD_HERE"

# Convert the encrypted password back to bytes
$encryptedBytes = [Convert]::FromBase64String($encryptedBase64)

# Decrypt using AES-256
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key
$aes.IV = $iv
$decryptor = $aes.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
$decryptedPassword = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)

Write-Host "`n✅ Your password is: $decryptedPassword"



