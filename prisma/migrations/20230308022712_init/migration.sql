/*
  Warnings:

  - You are about to drop the column `repliedById` on the `Message` table. All the data in the column will be lost.
  - You are about to drop the `SharedPost` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[repliedToMessageId]` on the table `Message` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sharedFromId` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `commentId` to the `Reaction` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_photoId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_repliedById_fkey";

-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_repliedById_fkey";

-- DropForeignKey
ALTER TABLE "SharedPost" DROP CONSTRAINT "SharedPost_postId_fkey";

-- DropForeignKey
ALTER TABLE "SharedPost" DROP CONSTRAINT "SharedPost_postedOnId_fkey";

-- DropIndex
DROP INDEX "Message_repliedById_key";

-- AlterTable
ALTER TABLE "Comment" ALTER COLUMN "comment" DROP NOT NULL,
ALTER COLUMN "photoId" DROP NOT NULL,
ALTER COLUMN "repliedById" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Message" DROP COLUMN "repliedById",
ADD COLUMN     "repliedToMessageId" INTEGER,
ALTER COLUMN "message" DROP NOT NULL,
ALTER COLUMN "reaction" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "sharedFromId" INTEGER NOT NULL,
ALTER COLUMN "caption" DROP NOT NULL,
ALTER COLUMN "location" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Reaction" ADD COLUMN     "commentId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "SharedPost";

-- CreateIndex
CREATE UNIQUE INDEX "Message_repliedToMessageId_key" ON "Message"("repliedToMessageId");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_repliedToMessageId_fkey" FOREIGN KEY ("repliedToMessageId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_sharedFromId_fkey" FOREIGN KEY ("sharedFromId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "CommentPhoto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_repliedById_fkey" FOREIGN KEY ("repliedById") REFERENCES "Comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
