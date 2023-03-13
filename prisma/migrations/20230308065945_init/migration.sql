/*
  Warnings:

  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `profilePictureId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Benefit` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Channel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChannelAdmin` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChannelLevel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ChannelSubscriber` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PictureUrl` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reaction` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Video` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_BenefitToChannelLevel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ChannelAdminToPermission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ChannelSubscriberToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ReactionToUser` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `balance` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "MachineTypeEnum" AS ENUM ('WASHER_FRONT', 'WASHER_TOP', 'DRYER');

-- CreateEnum
CREATE TYPE "ModeEnum" AS ENUM ('QUICK_WASH', 'DELICATE_WASH', 'WOOL', 'COLD_WASH', 'WARM_WASH', 'HOT_WASH', 'DRY', 'SOFT_WASH', 'HEAVY_WASH', 'CLEAN');

-- DropForeignKey
ALTER TABLE "Channel" DROP CONSTRAINT "Channel_profilePictureId_fkey";

-- DropForeignKey
ALTER TABLE "ChannelAdmin" DROP CONSTRAINT "ChannelAdmin_channelId_fkey";

-- DropForeignKey
ALTER TABLE "ChannelAdmin" DROP CONSTRAINT "ChannelAdmin_userId_fkey";

-- DropForeignKey
ALTER TABLE "ChannelLevel" DROP CONSTRAINT "ChannelLevel_channelSubscriberId_fkey";

-- DropForeignKey
ALTER TABLE "ChannelSubscriber" DROP CONSTRAINT "ChannelSubscriber_channelId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_commentToId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_userId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_videoId_fkey";

-- DropForeignKey
ALTER TABLE "Reaction" DROP CONSTRAINT "Reaction_videoId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_profilePictureId_fkey";

-- DropForeignKey
ALTER TABLE "Video" DROP CONSTRAINT "Video_channelId_fkey";

-- DropForeignKey
ALTER TABLE "_BenefitToChannelLevel" DROP CONSTRAINT "_BenefitToChannelLevel_A_fkey";

-- DropForeignKey
ALTER TABLE "_BenefitToChannelLevel" DROP CONSTRAINT "_BenefitToChannelLevel_B_fkey";

-- DropForeignKey
ALTER TABLE "_ChannelAdminToPermission" DROP CONSTRAINT "_ChannelAdminToPermission_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChannelAdminToPermission" DROP CONSTRAINT "_ChannelAdminToPermission_B_fkey";

-- DropForeignKey
ALTER TABLE "_ChannelSubscriberToUser" DROP CONSTRAINT "_ChannelSubscriberToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChannelSubscriberToUser" DROP CONSTRAINT "_ChannelSubscriberToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_ReactionToUser" DROP CONSTRAINT "_ReactionToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ReactionToUser" DROP CONSTRAINT "_ReactionToUser_B_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- DropIndex
DROP INDEX "User_profilePictureId_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createdAt",
DROP COLUMN "email",
DROP COLUMN "profilePictureId",
DROP COLUMN "updatedAt",
ADD COLUMN     "balance" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "phoneNumber" TEXT NOT NULL;

-- DropTable
DROP TABLE "Benefit";

-- DropTable
DROP TABLE "Channel";

-- DropTable
DROP TABLE "ChannelAdmin";

-- DropTable
DROP TABLE "ChannelLevel";

-- DropTable
DROP TABLE "ChannelSubscriber";

-- DropTable
DROP TABLE "Comment";

-- DropTable
DROP TABLE "Permission";

-- DropTable
DROP TABLE "PictureUrl";

-- DropTable
DROP TABLE "Reaction";

-- DropTable
DROP TABLE "Video";

-- DropTable
DROP TABLE "_BenefitToChannelLevel";

-- DropTable
DROP TABLE "_ChannelAdminToPermission";

-- DropTable
DROP TABLE "_ChannelSubscriberToUser";

-- DropTable
DROP TABLE "_ReactionToUser";

-- DropEnum
DROP TYPE "AdminRoleEnum";

-- DropEnum
DROP TYPE "BenefitEnum";

-- DropEnum
DROP TYPE "PermissionEnum";

-- DropEnum
DROP TYPE "ReactionEnum";

-- CreateTable
CREATE TABLE "Branch" (
    "id" SERIAL NOT NULL,
    "franchiseeId" INTEGER NOT NULL,
    "location" TEXT NOT NULL,
    "size" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Branch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Franchisee" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Franchisee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Machine" (
    "id" SERIAL NOT NULL,
    "type" "MachineTypeEnum" NOT NULL,
    "size" DOUBLE PRECISION NOT NULL,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "mfd" TIMESTAMP(3) NOT NULL,
    "warrantyExpirationDate" TIMESTAMP(3) NOT NULL,
    "branchId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Machine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mode" (
    "id" SERIAL NOT NULL,
    "mode" "ModeEnum" NOT NULL,
    "duration" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Mode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Maintenance" (
    "id" SERIAL NOT NULL,
    "levelId" INTEGER NOT NULL,
    "causes" TEXT NOT NULL,
    "machineId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Maintenance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Level" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Level_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "technician" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "joinDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "technician_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Usage" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "machineId" INTEGER NOT NULL,
    "modeId" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Usage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refillHistory" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "refillHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MachineToMode" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_MaintenanceTotechnician" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MachineToMode_AB_unique" ON "_MachineToMode"("A", "B");

-- CreateIndex
CREATE INDEX "_MachineToMode_B_index" ON "_MachineToMode"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MaintenanceTotechnician_AB_unique" ON "_MaintenanceTotechnician"("A", "B");

-- CreateIndex
CREATE INDEX "_MaintenanceTotechnician_B_index" ON "_MaintenanceTotechnician"("B");

-- AddForeignKey
ALTER TABLE "Branch" ADD CONSTRAINT "Branch_franchiseeId_fkey" FOREIGN KEY ("franchiseeId") REFERENCES "Franchisee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Machine" ADD CONSTRAINT "Machine_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Maintenance" ADD CONSTRAINT "Maintenance_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES "Level"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Maintenance" ADD CONSTRAINT "Maintenance_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES "Machine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usage" ADD CONSTRAINT "Usage_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usage" ADD CONSTRAINT "Usage_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES "Machine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usage" ADD CONSTRAINT "Usage_modeId_fkey" FOREIGN KEY ("modeId") REFERENCES "Mode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "refillHistory" ADD CONSTRAINT "refillHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MachineToMode" ADD CONSTRAINT "_MachineToMode_A_fkey" FOREIGN KEY ("A") REFERENCES "Machine"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MachineToMode" ADD CONSTRAINT "_MachineToMode_B_fkey" FOREIGN KEY ("B") REFERENCES "Mode"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MaintenanceTotechnician" ADD CONSTRAINT "_MaintenanceTotechnician_A_fkey" FOREIGN KEY ("A") REFERENCES "Maintenance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MaintenanceTotechnician" ADD CONSTRAINT "_MaintenanceTotechnician_B_fkey" FOREIGN KEY ("B") REFERENCES "technician"("id") ON DELETE CASCADE ON UPDATE CASCADE;
