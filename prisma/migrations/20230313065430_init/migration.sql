-- CreateTable
CREATE TABLE "_HashtagToTweetReply" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_HashtagToTweetReply_AB_unique" ON "_HashtagToTweetReply"("A", "B");

-- CreateIndex
CREATE INDEX "_HashtagToTweetReply_B_index" ON "_HashtagToTweetReply"("B");

-- AddForeignKey
ALTER TABLE "_HashtagToTweetReply" ADD CONSTRAINT "_HashtagToTweetReply_A_fkey" FOREIGN KEY ("A") REFERENCES "Hashtag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HashtagToTweetReply" ADD CONSTRAINT "_HashtagToTweetReply_B_fkey" FOREIGN KEY ("B") REFERENCES "TweetReply"("id") ON DELETE CASCADE ON UPDATE CASCADE;
