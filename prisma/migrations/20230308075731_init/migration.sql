/*
  Warnings:

  - The values [DRY] on the enum `ModeEnum` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `timeEnd` on the `Usage` table. All the data in the column will be lost.
  - You are about to drop the column `timeStart` on the `Usage` table. All the data in the column will be lost.
  - Added the required column `finishTime` to the `Usage` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startTime` to the `Usage` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "ModeEnum_new" AS ENUM ('QUICK_WASH', 'DELICATE_WASH', 'COLD_WASH', 'WARM_WASH', 'HOT_WASH', 'SOFT_WASH', 'HEAVY_WASH', 'WOOL', 'COLD_DRY', 'WARM_DRY', 'HOT_DRY', 'CLEAN');
ALTER TABLE "Mode" ALTER COLUMN "mode" TYPE "ModeEnum_new" USING ("mode"::text::"ModeEnum_new");
ALTER TYPE "ModeEnum" RENAME TO "ModeEnum_old";
ALTER TYPE "ModeEnum_new" RENAME TO "ModeEnum";
DROP TYPE "ModeEnum_old";
COMMIT;

-- AlterTable
ALTER TABLE "Usage" DROP COLUMN "timeEnd",
DROP COLUMN "timeStart",
ADD COLUMN     "finishTime" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "startTime" TIMESTAMP(3) NOT NULL;
