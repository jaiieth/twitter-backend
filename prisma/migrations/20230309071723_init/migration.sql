/*
  Warnings:

  - You are about to drop the `Author` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Book` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BookCopy` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Student` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TransferRequest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `University` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_AuthorToBook` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_BookToCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `borrowingHistory` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "BookCopy" DROP CONSTRAINT "BookCopy_ISBN_fkey";

-- DropForeignKey
ALTER TABLE "BookCopy" DROP CONSTRAINT "BookCopy_uniId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_uniId_fkey";

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_copyId_fkey";

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_fromUniId_fkey";

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_studentId_fkey";

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_toUniId_fkey";

-- DropForeignKey
ALTER TABLE "_AuthorToBook" DROP CONSTRAINT "_AuthorToBook_A_fkey";

-- DropForeignKey
ALTER TABLE "_AuthorToBook" DROP CONSTRAINT "_AuthorToBook_B_fkey";

-- DropForeignKey
ALTER TABLE "_BookToCategory" DROP CONSTRAINT "_BookToCategory_A_fkey";

-- DropForeignKey
ALTER TABLE "_BookToCategory" DROP CONSTRAINT "_BookToCategory_B_fkey";

-- DropForeignKey
ALTER TABLE "borrowingHistory" DROP CONSTRAINT "borrowingHistory_copyId_fkey";

-- DropForeignKey
ALTER TABLE "borrowingHistory" DROP CONSTRAINT "borrowingHistory_studentId_fkey";

-- DropForeignKey
ALTER TABLE "borrowingHistory" DROP CONSTRAINT "borrowingHistory_uniId_fkey";

-- DropTable
DROP TABLE "Author";

-- DropTable
DROP TABLE "Book";

-- DropTable
DROP TABLE "BookCopy";

-- DropTable
DROP TABLE "Category";

-- DropTable
DROP TABLE "Student";

-- DropTable
DROP TABLE "TransferRequest";

-- DropTable
DROP TABLE "University";

-- DropTable
DROP TABLE "_AuthorToBook";

-- DropTable
DROP TABLE "_BookToCategory";

-- DropTable
DROP TABLE "borrowingHistory";

-- DropEnum
DROP TYPE "StatusEnum";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Follower" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Follower_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hashtag" (
    "id" SERIAL NOT NULL,
    "hashtag" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Hashtag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostComment" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "likedByUserId" INTEGER NOT NULL,

    CONSTRAINT "PostComment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DirectMessage" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "toUserId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DirectMessage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FollowerToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LikePost" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_HashtagToPost" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "_FollowerToUser_AB_unique" ON "_FollowerToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_FollowerToUser_B_index" ON "_FollowerToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LikePost_AB_unique" ON "_LikePost"("A", "B");

-- CreateIndex
CREATE INDEX "_LikePost_B_index" ON "_LikePost"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_HashtagToPost_AB_unique" ON "_HashtagToPost"("A", "B");

-- CreateIndex
CREATE INDEX "_HashtagToPost_B_index" ON "_HashtagToPost"("B");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostComment" ADD CONSTRAINT "PostComment_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostComment" ADD CONSTRAINT "PostComment_likedByUserId_fkey" FOREIGN KEY ("likedByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DirectMessage" ADD CONSTRAINT "DirectMessage_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DirectMessage" ADD CONSTRAINT "DirectMessage_toUserId_fkey" FOREIGN KEY ("toUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FollowerToUser" ADD CONSTRAINT "_FollowerToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Follower"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FollowerToUser" ADD CONSTRAINT "_FollowerToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LikePost" ADD CONSTRAINT "_LikePost_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LikePost" ADD CONSTRAINT "_LikePost_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HashtagToPost" ADD CONSTRAINT "_HashtagToPost_A_fkey" FOREIGN KEY ("A") REFERENCES "Hashtag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HashtagToPost" ADD CONSTRAINT "_HashtagToPost_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;
