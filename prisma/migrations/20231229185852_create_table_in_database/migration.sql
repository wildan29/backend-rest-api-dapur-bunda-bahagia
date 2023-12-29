-- CreateTable
CREATE TABLE
    `pesanan` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `tanggal_pesaanan` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        `status` VARCHAR(20) NOT NULL,
        `total` INTEGER UNSIGNED NOT NULL,
        `metode_pembayaran` VARCHAR(20) NOT NULL,
        `id_user` INTEGER NOT NULL,

PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE InnoDB;

-- CreateTable
CREATE TABLE
    `DetailPesanan` (
        `id_pesanan` INTEGER NOT NULL,
        `id_produk` INTEGER NOT NULL,
        `jumlah` INTEGER UNSIGNED NOT NULL,
        `harga` INTEGER UNSIGNED NOT NULL,

PRIMARY KEY (`id_pesanan`, `id_produk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE InnoDB;

-- CreateTable
CREATE TABLE
    `produk` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nama` VARCHAR(30) NOT NULL,
        `harga` INTEGER UNSIGNED NOT NULL,
        `jumlah` INTEGER UNSIGNED NOT NULL,
        `deskripsi` VARCHAR(1000) NOT NULL,
        `gambar` VARCHAR(255) NOT NULL,
        `id_kategori` INTEGER NOT NULL,

PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE InnoDB;

-- CreateTable
CREATE TABLE
    `kategori` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nama` VARCHAR(50) NOT NULL,

PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE InnoDB;

-- AddForeignKey
ALTER TABLE `pesanan`
ADD
    CONSTRAINT `pesanan_id_user_fkey` FOREIGN KEY (`id_user`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailPesanan`
ADD
    CONSTRAINT `DetailPesanan_id_pesanan_fkey` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailPesanan`
ADD
    CONSTRAINT `DetailPesanan_id_produk_fkey` FOREIGN KEY (`id_produk`) REFERENCES `produk`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `produk`
ADD
    CONSTRAINT `produk_id_kategori_fkey` FOREIGN KEY (`id_kategori`) REFERENCES `Kategori`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;