/*
  Warnings:

  - Added the required column `timeEnd` to the `Usage` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timeStart` to the `Usage` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Usage" ADD COLUMN     "timeEnd" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "timeStart" TIMESTAMP(3) NOT NULL;
