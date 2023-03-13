/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Hashtag` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Hashtag` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `message` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `profileImage` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `DirectMessage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Follower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostComment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_FollowerToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_LikePost` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[mainProfilePhotoId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `caption` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `location` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `postedOnId` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coverImage` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mainProfilePhotoId` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "DirectMessage" DROP CONSTRAINT "DirectMessage_fromUserId_fkey";

-- DropForeignKey
ALTER TABLE "DirectMessage" DROP CONSTRAINT "DirectMessage_toUserId_fkey";

-- DropForeignKey
ALTER TABLE "PostComment" DROP CONSTRAINT "PostComment_likedByUserId_fkey";

-- DropForeignKey
ALTER TABLE "PostComment" DROP CONSTRAINT "PostComment_postId_fkey";

-- DropForeignKey
ALTER TABLE "_FollowerToUser" DROP CONSTRAINT "_FollowerToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_FollowerToUser" DROP CONSTRAINT "_FollowerToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_LikePost" DROP CONSTRAINT "_LikePost_A_fkey";

-- DropForeignKey
ALTER TABLE "_LikePost" DROP CONSTRAINT "_LikePost_B_fkey";

-- DropIndex
DROP INDEX "User_username_key";

-- AlterTable
ALTER TABLE "Hashtag" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "createdAt",
DROP COLUMN "message",
DROP COLUMN "updatedAt",
ADD COLUMN     "caption" TEXT NOT NULL,
ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "postedOnId" INTEGER NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createdAt",
DROP COLUMN "profileImage",
DROP COLUMN "updatedAt",
DROP COLUMN "username",
ADD COLUMN     "coverImage" TEXT NOT NULL,
ADD COLUMN     "mainProfilePhotoId" INTEGER NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL;

-- DropTable
DROP TABLE "DirectMessage";

-- DropTable
DROP TABLE "Follower";

-- DropTable
DROP TABLE "PostComment";

-- DropTable
DROP TABLE "_FollowerToUser";

-- DropTable
DROP TABLE "_LikePost";

-- CreateTable
CREATE TABLE "Message" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "reaction" TEXT NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "toUserId" INTEGER NOT NULL,
    "repliedById" INTEGER NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MessengerPhoto" (
    "id" SERIAL NOT NULL,
    "messagePhotoUrl" TEXT NOT NULL,
    "messageId" INTEGER NOT NULL,

    CONSTRAINT "MessengerPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostPhoto" (
    "id" SERIAL NOT NULL,
    "postPhotoUrl" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "PostPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfilePhoto" (
    "id" SERIAL NOT NULL,
    "profilePhotoUrl" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "ProfilePhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SharedPost" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER NOT NULL,
    "postedOnId" INTEGER NOT NULL,

    CONSTRAINT "SharedPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostedOn" (
    "id" SERIAL NOT NULL,
    "postedOn" TEXT NOT NULL,

    CONSTRAINT "PostedOn_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "comment" TEXT NOT NULL,
    "photoId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "repliedById" INTEGER NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommentPhoto" (
    "id" SERIAL NOT NULL,
    "commentId" INTEGER NOT NULL,

    CONSTRAINT "CommentPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reaction" (
    "id" SERIAL NOT NULL,
    "reaction" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Reaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "typeId" INTEGER NOT NULL,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupType" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "GroupType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_friends" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_share" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_group" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Message_repliedById_key" ON "Message"("repliedById");

-- CreateIndex
CREATE UNIQUE INDEX "Comment_photoId_key" ON "Comment"("photoId");

-- CreateIndex
CREATE UNIQUE INDEX "Comment_repliedById_key" ON "Comment"("repliedById");

-- CreateIndex
CREATE UNIQUE INDEX "_friends_AB_unique" ON "_friends"("A", "B");

-- CreateIndex
CREATE INDEX "_friends_B_index" ON "_friends"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_share_AB_unique" ON "_share"("A", "B");

-- CreateIndex
CREATE INDEX "_share_B_index" ON "_share"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_group_AB_unique" ON "_group"("A", "B");

-- CreateIndex
CREATE INDEX "_group_B_index" ON "_group"("B");

-- CreateIndex
CREATE UNIQUE INDEX "User_mainProfilePhotoId_key" ON "User"("mainProfilePhotoId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_mainProfilePhotoId_fkey" FOREIGN KEY ("mainProfilePhotoId") REFERENCES "ProfilePhoto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_toUserId_fkey" FOREIGN KEY ("toUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_repliedById_fkey" FOREIGN KEY ("repliedById") REFERENCES "Message"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessengerPhoto" ADD CONSTRAINT "MessengerPhoto_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Message"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostPhoto" ADD CONSTRAINT "PostPhoto_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfilePhoto" ADD CONSTRAINT "ProfilePhoto_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_postedOnId_fkey" FOREIGN KEY ("postedOnId") REFERENCES "PostedOn"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SharedPost" ADD CONSTRAINT "SharedPost_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SharedPost" ADD CONSTRAINT "SharedPost_postedOnId_fkey" FOREIGN KEY ("postedOnId") REFERENCES "PostedOn"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "CommentPhoto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_repliedById_fkey" FOREIGN KEY ("repliedById") REFERENCES "Comment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "GroupType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_friends" ADD CONSTRAINT "_friends_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_friends" ADD CONSTRAINT "_friends_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_share" ADD CONSTRAINT "_share_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_share" ADD CONSTRAINT "_share_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_group" ADD CONSTRAINT "_group_A_fkey" FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_group" ADD CONSTRAINT "_group_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
