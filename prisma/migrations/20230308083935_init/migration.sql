/*
  Warnings:

  - You are about to drop the `Branch` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Franchisee` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Level` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Machine` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Maintenance` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Mode` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_MachineToMode` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_MaintenanceTotechnician` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `refillHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `technician` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "StatusEnum" AS ENUM ('BORROWED', 'AVAILABLE', 'EXCEED_RETURN_DATE');

-- DropForeignKey
ALTER TABLE "Branch" DROP CONSTRAINT "Branch_franchiseeId_fkey";

-- DropForeignKey
ALTER TABLE "Machine" DROP CONSTRAINT "Machine_branchId_fkey";

-- DropForeignKey
ALTER TABLE "Maintenance" DROP CONSTRAINT "Maintenance_levelId_fkey";

-- DropForeignKey
ALTER TABLE "Maintenance" DROP CONSTRAINT "Maintenance_machineId_fkey";

-- DropForeignKey
ALTER TABLE "Usage" DROP CONSTRAINT "Usage_machineId_fkey";

-- DropForeignKey
ALTER TABLE "Usage" DROP CONSTRAINT "Usage_modeId_fkey";

-- DropForeignKey
ALTER TABLE "Usage" DROP CONSTRAINT "Usage_userId_fkey";

-- DropForeignKey
ALTER TABLE "_MachineToMode" DROP CONSTRAINT "_MachineToMode_A_fkey";

-- DropForeignKey
ALTER TABLE "_MachineToMode" DROP CONSTRAINT "_MachineToMode_B_fkey";

-- DropForeignKey
ALTER TABLE "_MaintenanceTotechnician" DROP CONSTRAINT "_MaintenanceTotechnician_A_fkey";

-- DropForeignKey
ALTER TABLE "_MaintenanceTotechnician" DROP CONSTRAINT "_MaintenanceTotechnician_B_fkey";

-- DropForeignKey
ALTER TABLE "refillHistory" DROP CONSTRAINT "refillHistory_userId_fkey";

-- DropTable
DROP TABLE "Branch";

-- DropTable
DROP TABLE "Franchisee";

-- DropTable
DROP TABLE "Level";

-- DropTable
DROP TABLE "Machine";

-- DropTable
DROP TABLE "Maintenance";

-- DropTable
DROP TABLE "Mode";

-- DropTable
DROP TABLE "Usage";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "_MachineToMode";

-- DropTable
DROP TABLE "_MaintenanceTotechnician";

-- DropTable
DROP TABLE "refillHistory";

-- DropTable
DROP TABLE "technician";

-- DropEnum
DROP TYPE "MachineTypeEnum";

-- DropEnum
DROP TYPE "ModeEnum";

-- CreateTable
CREATE TABLE "University" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "University_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" SERIAL NOT NULL,
    "uniId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Book" (
    "id" SERIAL NOT NULL,
    "ISBN" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BookCopy" (
    "id" SERIAL NOT NULL,
    "ISBN" TEXT NOT NULL,
    "uniId" INTEGER NOT NULL,
    "status" "StatusEnum" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BookCopy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Author" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Author_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "borrowingHistory" (
    "id" SERIAL NOT NULL,
    "borrowingDate" TIMESTAMP(3) NOT NULL,
    "scheduleReturnDate" TIMESTAMP(3) NOT NULL,
    "actualReturnDate" TIMESTAMP(3) NOT NULL,
    "studentId" INTEGER NOT NULL,
    "uniId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "borrowingHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransferRequest" (
    "id" SERIAL NOT NULL,
    "studentId" INTEGER NOT NULL,
    "fromUniId" INTEGER NOT NULL,
    "toUniId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransferRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_BookToCategory" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_BookCopyToborrowingHistory" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AuthorToBook" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Book_ISBN_key" ON "Book"("ISBN");

-- CreateIndex
CREATE UNIQUE INDEX "_BookToCategory_AB_unique" ON "_BookToCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_BookToCategory_B_index" ON "_BookToCategory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BookCopyToborrowingHistory_AB_unique" ON "_BookCopyToborrowingHistory"("A", "B");

-- CreateIndex
CREATE INDEX "_BookCopyToborrowingHistory_B_index" ON "_BookCopyToborrowingHistory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AuthorToBook_AB_unique" ON "_AuthorToBook"("A", "B");

-- CreateIndex
CREATE INDEX "_AuthorToBook_B_index" ON "_AuthorToBook"("B");

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_uniId_fkey" FOREIGN KEY ("uniId") REFERENCES "University"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookCopy" ADD CONSTRAINT "BookCopy_ISBN_fkey" FOREIGN KEY ("ISBN") REFERENCES "Book"("ISBN") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookCopy" ADD CONSTRAINT "BookCopy_uniId_fkey" FOREIGN KEY ("uniId") REFERENCES "University"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "borrowingHistory" ADD CONSTRAINT "borrowingHistory_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "borrowingHistory" ADD CONSTRAINT "borrowingHistory_uniId_fkey" FOREIGN KEY ("uniId") REFERENCES "University"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_fromUniId_fkey" FOREIGN KEY ("fromUniId") REFERENCES "University"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_toUniId_fkey" FOREIGN KEY ("toUniId") REFERENCES "University"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToCategory" ADD CONSTRAINT "_BookToCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToCategory" ADD CONSTRAINT "_BookToCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookCopyToborrowingHistory" ADD CONSTRAINT "_BookCopyToborrowingHistory_A_fkey" FOREIGN KEY ("A") REFERENCES "BookCopy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookCopyToborrowingHistory" ADD CONSTRAINT "_BookCopyToborrowingHistory_B_fkey" FOREIGN KEY ("B") REFERENCES "borrowingHistory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_A_fkey" FOREIGN KEY ("A") REFERENCES "Author"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_B_fkey" FOREIGN KEY ("B") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;
