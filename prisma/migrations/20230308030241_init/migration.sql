-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "sharedFromId" INTEGER;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_sharedFromId_fkey" FOREIGN KEY ("sharedFromId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
