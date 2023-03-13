/*
  Warnings:

  - You are about to drop the column `causes` on the `Maintenance` table. All the data in the column will be lost.
  - Added the required column `cause` to the `Maintenance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `refillHistory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Maintenance" DROP COLUMN "causes",
ADD COLUMN     "cause" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "refillHistory" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
