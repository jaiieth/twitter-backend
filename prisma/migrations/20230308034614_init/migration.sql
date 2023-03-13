-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_commentToId_fkey";

-- AlterTable
ALTER TABLE "Comment" ALTER COLUMN "commentToId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_commentToId_fkey" FOREIGN KEY ("commentToId") REFERENCES "Comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
