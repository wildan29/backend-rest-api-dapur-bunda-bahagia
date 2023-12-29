/*
  Warnings:

  - You are about to drop the `kategori` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `produk` DROP FOREIGN KEY `produk_id_kategori_fkey`;

-- DropTable
DROP TABLE `kategori`;
