/*
  Warnings:

  - You are about to drop the `_group` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `privacyId` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_group" DROP CONSTRAINT "_group_A_fkey";

-- DropForeignKey
ALTER TABLE "_group" DROP CONSTRAINT "_group_B_fkey";

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "privacyId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_group";

-- CreateTable
CREATE TABLE "UserNotification" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "UserNotification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostPrivacy" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "PostPrivacy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PostToUserNotification" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PostPrivacyToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_groupMember" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GroupToUserNotification" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PostToUserNotification_AB_unique" ON "_PostToUserNotification"("A", "B");

-- CreateIndex
CREATE INDEX "_PostToUserNotification_B_index" ON "_PostToUserNotification"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PostPrivacyToUser_AB_unique" ON "_PostPrivacyToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_PostPrivacyToUser_B_index" ON "_PostPrivacyToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_groupMember_AB_unique" ON "_groupMember"("A", "B");

-- CreateIndex
CREATE INDEX "_groupMember_B_index" ON "_groupMember"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GroupToUserNotification_AB_unique" ON "_GroupToUserNotification"("A", "B");

-- CreateIndex
CREATE INDEX "_GroupToUserNotification_B_index" ON "_GroupToUserNotification"("B");

-- AddForeignKey
ALTER TABLE "UserNotification" ADD CONSTRAINT "UserNotification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_privacyId_fkey" FOREIGN KEY ("privacyId") REFERENCES "PostPrivacy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostToUserNotification" ADD CONSTRAINT "_PostToUserNotification_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostToUserNotification" ADD CONSTRAINT "_PostToUserNotification_B_fkey" FOREIGN KEY ("B") REFERENCES "UserNotification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostPrivacyToUser" ADD CONSTRAINT "_PostPrivacyToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "PostPrivacy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostPrivacyToUser" ADD CONSTRAINT "_PostPrivacyToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_groupMember" ADD CONSTRAINT "_groupMember_A_fkey" FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_groupMember" ADD CONSTRAINT "_groupMember_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToUserNotification" ADD CONSTRAINT "_GroupToUserNotification_A_fkey" FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToUserNotification" ADD CONSTRAINT "_GroupToUserNotification_B_fkey" FOREIGN KEY ("B") REFERENCES "UserNotification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
