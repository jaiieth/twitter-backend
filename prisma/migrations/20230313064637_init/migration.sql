-- DropForeignKey
ALTER TABLE "TweetReply" DROP CONSTRAINT "TweetReply_likedByUserId_fkey";

-- AlterTable
ALTER TABLE "TweetReply" ALTER COLUMN "likedByUserId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "TweetReply" ADD CONSTRAINT "TweetReply_likedByUserId_fkey" FOREIGN KEY ("likedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
