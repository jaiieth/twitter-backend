/*
  Warnings:

  - Added the required column `toUserId` to the `DirectMessage` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "DirectMessage" ADD COLUMN     "toUserId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "DirectMessage" ADD CONSTRAINT "DirectMessage_toUserId_fkey" FOREIGN KEY ("toUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
