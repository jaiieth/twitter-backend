/*
  Warnings:

  - You are about to drop the column `name` on the `Hashtag` table. All the data in the column will be lost.
  - Added the required column `hashtag` to the `Hashtag` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Hashtag" DROP COLUMN "name",
ADD COLUMN     "hashtag" TEXT NOT NULL;
