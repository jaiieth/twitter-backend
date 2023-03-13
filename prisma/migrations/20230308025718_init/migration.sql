/*
  Warnings:

  - You are about to drop the column `postedOnId` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `sharedFromId` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the `CommentPhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MessengerPhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostPhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostedOn` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProfilePhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_GroupToPostedOn` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PostedOnToUser` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Group` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `type` on the `GroupType` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `updatedAt` to the `Hashtag` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Message` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Reaction` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `reaction` on the `Reaction` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `UserNotification` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "sharedOnEnum" AS ENUM ('Profile', 'Group', 'PAGE');

-- CreateEnum
CREATE TYPE "ReactionEnum" AS ENUM ('LIKE', 'SAD', 'ANGRAY', 'LOVE', 'LOL');

-- CreateEnum
CREATE TYPE "GroupTypeEnum" AS ENUM ('PUBLIC', 'PRIVATE');

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_photoId_fkey";

-- DropForeignKey
ALTER TABLE "MessengerPhoto" DROP CONSTRAINT "MessengerPhoto_messageId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_postedOnId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_sharedFromId_fkey";

-- DropForeignKey
ALTER TABLE "PostPhoto" DROP CONSTRAINT "PostPhoto_postId_fkey";

-- DropForeignKey
ALTER TABLE "ProfilePhoto" DROP CONSTRAINT "ProfilePhoto_userId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_commentId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_postId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_mainProfilePhotoId_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToPostedOn" DROP CONSTRAINT "_GroupToPostedOn_A_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToPostedOn" DROP CONSTRAINT "_GroupToPostedOn_B_fkey";

-- DropForeignKey
ALTER TABLE "_PostedOnToUser" DROP CONSTRAINT "_PostedOnToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_PostedOnToUser" DROP CONSTRAINT "_PostedOnToUser_B_fkey";

-- AlterTable
ALTER TABLE "Comment" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Group" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "GroupType" DROP COLUMN "type",
ADD COLUMN     "type" "GroupTypeEnum" NOT NULL;

-- AlterTable
ALTER TABLE "Hashtag" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Message" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "postedOnId",
DROP COLUMN "sharedFromId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Reaction" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
DROP COLUMN "reaction",
ADD COLUMN     "reaction" "ReactionEnum" NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL,
ALTER COLUMN "commentId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "UserNotification" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "CommentPhoto";

-- DropTable
DROP TABLE "MessengerPhoto";

-- DropTable
DROP TABLE "PostPhoto";

-- DropTable
DROP TABLE "PostedOn";

-- DropTable
DROP TABLE "ProfilePhoto";

-- DropTable
DROP TABLE "_GroupToPostedOn";

-- DropTable
DROP TABLE "_PostedOnToUser";

-- CreateTable
CREATE TABLE "SharedOn" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER,
    "sharedOn" "sharedOnEnum" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SharedOn_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Photo" (
    "id" SERIAL NOT NULL,
    "photoUrl" TEXT NOT NULL,
    "messageId" INTEGER,
    "postId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "commentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Photo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SharedOnToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GroupToSharedOn" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SharedOnToUser_AB_unique" ON "_SharedOnToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_SharedOnToUser_B_index" ON "_SharedOnToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GroupToSharedOn_AB_unique" ON "_GroupToSharedOn"("A", "B");

-- CreateIndex
CREATE INDEX "_GroupToSharedOn_B_index" ON "_GroupToSharedOn"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_mainProfilePhotoId_fkey" FOREIGN KEY ("mainProfilePhotoId") REFERENCES "Photo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SharedOn" ADD CONSTRAINT "SharedOn_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "Photo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Photo" ADD CONSTRAINT "Photo_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Photo" ADD CONSTRAINT "Photo_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Photo" ADD CONSTRAINT "Photo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SharedOnToUser" ADD CONSTRAINT "_SharedOnToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "SharedOn"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SharedOnToUser" ADD CONSTRAINT "_SharedOnToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToSharedOn" ADD CONSTRAINT "_GroupToSharedOn_A_fkey" FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToSharedOn" ADD CONSTRAINT "_GroupToSharedOn_B_fkey" FOREIGN KEY ("B") REFERENCES "SharedOn"("id") ON DELETE CASCADE ON UPDATE CASCADE;
