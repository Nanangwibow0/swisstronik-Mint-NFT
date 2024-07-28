#!/bin/sh

# Fungsi untuk menangani kesalahan
handle_error() {
    echo "Terjadi kesalahan dalam eksekusi skrip. Keluar."
    exit 1
}

# Menangkap setiap kesalahan
trap 'handle_error' ERR

# Meminta kredensial GitHub
read -p "Masukkan username GitHub Anda: " GITHUB_USERNAME
read -p "Masukkan Personal Access Token (PAT) GitHub Anda: " -s GITHUB_TOKEN
echo

# URL repository baru
REPO_URL="https://github.com/Nanangwibow0/swisstronik-Mint-NFT.git"

# Hapus remote yang ada jika ada
echo "Menghapus remote yang ada..."
git remote remove origin || echo "Tidak ada remote origin yang ditemukan."

# Tambahkan URL remote baru dengan token baru
echo "Menambahkan URL remote baru dengan token baru..."
git remote add origin https://$GITHUB_USERNAME:$GITHUB_TOKEN@$REPO_URL

# Hapus kredensial yang tersimpan
echo "Menghapus kredensial yang tersimpan..."
git credential-cache exit

# Setel cabang ke main
echo "Menyetel cabang ke main..."
git branch -M main

# Dorong perubahan
echo "Mendorong perubahan ke repository remote..."
git push -u origin main

echo "Selesai."
