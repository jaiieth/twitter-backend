/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostComment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HashtagToPost` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_LikePost` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_userId_fkey";

-- DropForeignKey
ALTER TABLE "PostComment" DROP CONSTRAINT "PostComment_likedByUserId_fkey";

-- DropForeignKey
ALTER TABLE "PostComment" DROP CONSTRAINT "PostComment_postId_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToPost" DROP CONSTRAINT "_HashtagToPost_A_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToPost" DROP CONSTRAINT "_HashtagToPost_B_fkey";

-- DropForeignKey
ALTER TABLE "_LikePost" DROP CONSTRAINT "_LikePost_A_fkey";

-- DropForeignKey
ALTER TABLE "_LikePost" DROP CONSTRAINT "_LikePost_B_fkey";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "PostComment";

-- DropTable
DROP TABLE "_HashtagToPost";

-- DropTable
DROP TABLE "_LikePost";

-- CreateTable
CREATE TABLE "Tweet" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tweet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TweetComment" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "tweetId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "likedByUserId" INTEGER NOT NULL,

    CONSTRAINT "TweetComment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_LikeTweet" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_HashtagToTweet" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_LikeTweet_AB_unique" ON "_LikeTweet"("A", "B");

-- CreateIndex
CREATE INDEX "_LikeTweet_B_index" ON "_LikeTweet"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_HashtagToTweet_AB_unique" ON "_HashtagToTweet"("A", "B");

-- CreateIndex
CREATE INDEX "_HashtagToTweet_B_index" ON "_HashtagToTweet"("B");

-- AddForeignKey
ALTER TABLE "Tweet" ADD CONSTRAINT "Tweet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TweetComment" ADD CONSTRAINT "TweetComment_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "Tweet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TweetComment" ADD CONSTRAINT "TweetComment_likedByUserId_fkey" FOREIGN KEY ("likedByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LikeTweet" ADD CONSTRAINT "_LikeTweet_A_fkey" FOREIGN KEY ("A") REFERENCES "Tweet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LikeTweet" ADD CONSTRAINT "_LikeTweet_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HashtagToTweet" ADD CONSTRAINT "_HashtagToTweet_A_fkey" FOREIGN KEY ("A") REFERENCES "Hashtag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HashtagToTweet" ADD CONSTRAINT "_HashtagToTweet_B_fkey" FOREIGN KEY ("B") REFERENCES "Tweet"("id") ON DELETE CASCADE ON UPDATE CASCADE;
