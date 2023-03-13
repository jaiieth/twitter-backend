/*
  Warnings:

  - You are about to drop the `_share` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_share" DROP CONSTRAINT "_share_A_fkey";

-- DropForeignKey
ALTER TABLE "_share" DROP CONSTRAINT "_share_B_fkey";

-- DropTable
DROP TABLE "_share";

-- CreateTable
CREATE TABLE "_PostedOnToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GroupToPostedOn" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PostedOnToUser_AB_unique" ON "_PostedOnToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_PostedOnToUser_B_index" ON "_PostedOnToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GroupToPostedOn_AB_unique" ON "_GroupToPostedOn"("A", "B");

-- CreateIndex
CREATE INDEX "_GroupToPostedOn_B_index" ON "_GroupToPostedOn"("B");

-- AddForeignKey
ALTER TABLE "_PostedOnToUser" ADD CONSTRAINT "_PostedOnToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "PostedOn"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostedOnToUser" ADD CONSTRAINT "_PostedOnToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToPostedOn" ADD CONSTRAINT "_GroupToPostedOn_A_fkey" FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupToPostedOn" ADD CONSTRAINT "_GroupToPostedOn_B_fkey" FOREIGN KEY ("B") REFERENCES "PostedOn"("id") ON DELETE CASCADE ON UPDATE CASCADE;
