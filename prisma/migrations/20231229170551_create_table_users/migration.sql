-- AlterTable
ALTER TABLE `users` MODIFY `token` VARCHAR(100) NULL,
    MODIFY `email` VARCHAR(255) NOT NULL;
