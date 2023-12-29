/*
  Warnings:

  - You are about to drop the `detailpesanan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pesanan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `produk` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `detailpesanan` DROP FOREIGN KEY `DetailPesanan_id_pesanan_fkey`;

-- DropForeignKey
ALTER TABLE `detailpesanan` DROP FOREIGN KEY `DetailPesanan_id_produk_fkey`;

-- DropForeignKey
ALTER TABLE `pesanan` DROP FOREIGN KEY `pesanan_id_user_fkey`;

-- DropTable
DROP TABLE `detailpesanan`;

-- DropTable
DROP TABLE `pesanan`;

-- DropTable
DROP TABLE `produk`;

-- DropTable
DROP TABLE `users`;
