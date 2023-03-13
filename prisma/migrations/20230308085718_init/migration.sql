/*
  Warnings:

  - Added the required column `copyId` to the `TransferRequest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TransferRequest" ADD COLUMN     "copyId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_copyId_fkey" FOREIGN KEY ("copyId") REFERENCES "BookCopy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
