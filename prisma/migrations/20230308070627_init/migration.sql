/*
  Warnings:

  - You are about to drop the column `price` on the `Usage` table. All the data in the column will be lost.
  - Added the required column `price` to the `Mode` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Mode" ADD COLUMN     "price" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "Usage" DROP COLUMN "price";
