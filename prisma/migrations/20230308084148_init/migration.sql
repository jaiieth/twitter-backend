/*
  Warnings:

  - You are about to drop the `_BookCopyToborrowingHistory` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `copyId` to the `borrowingHistory` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_BookCopyToborrowingHistory" DROP CONSTRAINT "_BookCopyToborrowingHistory_A_fkey";

-- DropForeignKey
ALTER TABLE "_BookCopyToborrowingHistory" DROP CONSTRAINT "_BookCopyToborrowingHistory_B_fkey";

-- AlterTable
ALTER TABLE "borrowingHistory" ADD COLUMN     "copyId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_BookCopyToborrowingHistory";

-- AddForeignKey
ALTER TABLE "borrowingHistory" ADD CONSTRAINT "borrowingHistory_copyId_fkey" FOREIGN KEY ("copyId") REFERENCES "BookCopy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
