/*
  Warnings:

  - You are about to drop the `TweetReply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HashtagToTweetReply` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TweetReply" DROP CONSTRAINT "TweetReply_likedByUserId_fkey";

-- DropForeignKey
ALTER TABLE "TweetReply" DROP CONSTRAINT "TweetReply_tweetId_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToTweetReply" DROP CONSTRAINT "_HashtagToTweetReply_A_fkey";

-- DropForeignKey
ALTER TABLE "_HashtagToTweetReply" DROP CONSTRAINT "_HashtagToTweetReply_B_fkey";

-- DropTable
DROP TABLE "TweetReply";

-- DropTable
DROP TABLE "_HashtagToTweetReply";

-- CreateTable
CREATE TABLE "_TweetReply" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_TweetReply_AB_unique" ON "_TweetReply"("A", "B");

-- CreateIndex
CREATE INDEX "_TweetReply_B_index" ON "_TweetReply"("B");

-- AddForeignKey
ALTER TABLE "_TweetReply" ADD CONSTRAINT "_TweetReply_A_fkey" FOREIGN KEY ("A") REFERENCES "Tweet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TweetReply" ADD CONSTRAINT "_TweetReply_B_fkey" FOREIGN KEY ("B") REFERENCES "Tweet"("id") ON DELETE CASCADE ON UPDATE CASCADE;
