/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `photoId` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `postId` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `repliedById` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `coverImage` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `mainProfilePhotoId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Group` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GroupType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Hashtag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Photo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostPrivacy` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reaction` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SharedOn` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserNotification` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_GroupToSharedOn` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_GroupToUserNotification` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HashtagToPost` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PostPrivacyToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PostToUserNotification` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SharedOnToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_friends` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_groupMember` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[profilePictureId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `commentToId` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `videoId` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Made the column `comment` on table `Comment` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `email` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "AdminRoleEnum" AS ENUM ('Admin', 'Editor', 'Creator');

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_photoId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_postId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_repliedById_fkey";

-- DropForeignKey
ALTER TABLE "Group" DROP CONSTRAINT "Group_typeId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_fromUserId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_repliedToMessageId_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_toUserId_fkey";

-- DropForeignKey
ALTER TABLE "Photo" DROP CONSTRAINT "Photo_messageId_fkey";

-- DropForeignKey
ALTER TABLE "Photo" DROP CONSTRAINT "Photo_postId_fkey";

-- DropForeignKey
ALTER TABLE "Photo" DROP CONSTRAINT "Photo_userId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_privacyId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_sharedFromId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_userId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_commentId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_postId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_userId_fkey";

-- DropForeignKey
ALTER TABLE "SharedOn" DROP CONSTRAINT "SharedOn_postId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_mainProfilePhotoId_fkey";

-- DropForeignKey
ALTER TABLE "UserNotification" DROP CONSTRAINT "UserNotification_userId_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToSharedOn" DROP CONSTRAINT "_GroupToSharedOn_A_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToSharedOn" DROP CONSTRAINT "_GroupToSharedOn_B_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToUserNotification" DROP CONSTRAINT "_GroupToUserNotification_A_fkey";

-- DropForeignKey
ALTER TABLE "_GroupToUserNotification" DROP CONSTRAINT "_GroupToUserNotification_B_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToPost" DROP CONSTRAINT "_HashtagToPost_A_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToPost" DROP CONSTRAINT "_HashtagToPost_B_fkey";

-- DropForeignKey
ALTER TABLE "_PostPrivacyToUser" DROP CONSTRAINT "_PostPrivacyToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_PostPrivacyToUser" DROP CONSTRAINT "_PostPrivacyToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_PostToUserNotification" DROP CONSTRAINT "_PostToUserNotification_A_fkey";

-- DropForeignKey
ALTER TABLE "_PostToUserNotification" DROP CONSTRAINT "_PostToUserNotification_B_fkey";

-- DropForeignKey
ALTER TABLE "_SharedOnToUser" DROP CONSTRAINT "_SharedOnToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_SharedOnToUser" DROP CONSTRAINT "_SharedOnToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_friends" DROP CONSTRAINT "_friends_A_fkey";

-- DropForeignKey
ALTER TABLE "_friends" DROP CONSTRAINT "_friends_B_fkey";

-- DropForeignKey
ALTER TABLE "_groupMember" DROP CONSTRAINT "_groupMember_A_fkey";

-- DropForeignKey
ALTER TABLE "_groupMember" DROP CONSTRAINT "_groupMember_B_fkey";

-- DropIndex
DROP INDEX "Comment_photoId_key";

-- DropIndex
DROP INDEX "Comment_repliedById_key";

-- DropIndex
DROP INDEX "User_mainProfilePhotoId_key";

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "createdAt",
DROP COLUMN "photoId",
DROP COLUMN "postId",
DROP COLUMN "repliedById",
DROP COLUMN "updatedAt",
ADD COLUMN     "commentToId" INTEGER NOT NULL,
ADD COLUMN     "videoId" INTEGER NOT NULL,
ALTER COLUMN "comment" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "coverImage",
DROP COLUMN "createdAt",
DROP COLUMN "mainProfilePhotoId",
DROP COLUMN "updatedAt",
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "profilePictureId" INTEGER;

-- DropTable
DROP TABLE "Group";

-- DropTable
DROP TABLE "GroupType";

-- DropTable
DROP TABLE "Hashtag";

-- DropTable
DROP TABLE "Message";

-- DropTable
DROP TABLE "Photo";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "PostPrivacy";

-- DropTable
DROP TABLE "Reaction";

-- DropTable
DROP TABLE "SharedOn";

-- DropTable
DROP TABLE "UserNotification";

-- DropTable
DROP TABLE "_GroupToSharedOn";

-- DropTable
DROP TABLE "_GroupToUserNotification";

-- DropTable
DROP TABLE "_HashtagToPost";

-- DropTable
DROP TABLE "_PostPrivacyToUser";

-- DropTable
DROP TABLE "_PostToUserNotification";

-- DropTable
DROP TABLE "_SharedOnToUser";

-- DropTable
DROP TABLE "_friends";

-- DropTable
DROP TABLE "_groupMember";

-- DropEnum
DROP TYPE "GroupTypeEnum";

-- DropEnum
DROP TYPE "ReactionEnum";

-- DropEnum
DROP TYPE "sharedOnEnum";

-- CreateTable
CREATE TABLE "Channel" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "profilePictureId" INTEGER,

    CONSTRAINT "Channel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelAdmin" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "role" "AdminRoleEnum" NOT NULL,
    "channelId" INTEGER NOT NULL,

    CONSTRAINT "ChannelAdmin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PictureUrl" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "PictureUrl_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Video" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "channelId" INTEGER NOT NULL,

    CONSTRAINT "Video_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Subscribe" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Channel_profilePictureId_key" ON "Channel"("profilePictureId");

-- CreateIndex
CREATE UNIQUE INDEX "_Subscribe_AB_unique" ON "_Subscribe"("A", "B");

-- CreateIndex
CREATE INDEX "_Subscribe_B_index" ON "_Subscribe"("B");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_profilePictureId_key" ON "User"("profilePictureId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_profilePictureId_fkey" FOREIGN KEY ("profilePictureId") REFERENCES "PictureUrl"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_profilePictureId_fkey" FOREIGN KEY ("profilePictureId") REFERENCES "PictureUrl"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelAdmin" ADD CONSTRAINT "ChannelAdmin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelAdmin" ADD CONSTRAINT "ChannelAdmin_channelId_fkey" FOREIGN KEY ("channelId") REFERENCES "Channel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_channelId_fkey" FOREIGN KEY ("channelId") REFERENCES "Channel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES "Video"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_commentToId_fkey" FOREIGN KEY ("commentToId") REFERENCES "Comment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscribe" ADD CONSTRAINT "_Subscribe_A_fkey" FOREIGN KEY ("A") REFERENCES "Channel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscribe" ADD CONSTRAINT "_Subscribe_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
