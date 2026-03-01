# Update all PDF links from GitHub raw URLs to local /policies/ paths
$files = Get-ChildItem "policies\*.mdx"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace GitHub raw URLs with local paths
    $updated = $content -replace 'https://github.com/raj1882/docs/raw/main/policies/', '/policies/'
    
    if ($content -ne $updated) {
        Set-Content -Path $file.FullName -Value $updated -NoNewline
        Write-Host "Updated: $($file.Name)"
    }
}

Write-Host "`nDone! All PDF links updated to local paths."