/*
  Warnings:

  - You are about to drop the `Follower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_FollowerToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_FollowerToUser" DROP CONSTRAINT "_FollowerToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_FollowerToUser" DROP CONSTRAINT "_FollowerToUser_B_fkey";

-- DropTable
DROP TABLE "Follower";

-- DropTable
DROP TABLE "_FollowerToUser";

-- CreateTable
CREATE TABLE "_Following" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Following_AB_unique" ON "_Following"("A", "B");

-- CreateIndex
CREATE INDEX "_Following_B_index" ON "_Following"("B");

-- AddForeignKey
ALTER TABLE "_Following" ADD CONSTRAINT "_Following_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Following" ADD CONSTRAINT "_Following_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
