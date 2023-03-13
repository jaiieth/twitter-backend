/*
  Warnings:

  - You are about to drop the `TweetComment` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TweetComment" DROP CONSTRAINT "TweetComment_likedByUserId_fkey";

-- DropForeignKey
ALTER TABLE "TweetComment" DROP CONSTRAINT "TweetComment_tweetId_fkey";

-- DropTable
DROP TABLE "TweetComment";

-- CreateTable
CREATE TABLE "TweetReply" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "tweetId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "likedByUserId" INTEGER NOT NULL,

    CONSTRAINT "TweetReply_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TweetReply" ADD CONSTRAINT "TweetReply_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "Tweet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TweetReply" ADD CONSTRAINT "TweetReply_likedByUserId_fkey" FOREIGN KEY ("likedByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
