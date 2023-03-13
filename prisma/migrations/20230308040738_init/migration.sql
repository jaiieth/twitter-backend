/*
  Warnings:

  - You are about to drop the column `role` on the `ChannelAdmin` table. All the data in the column will be lost.
  - You are about to drop the `_Subscribe` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `roleName` to the `ChannelAdmin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reactionId` to the `Video` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "BenefitEnum" AS ENUM ('EMOTICON', 'EARLY_ACCESS', 'COMMUNITY_VIDEO');

-- CreateEnum
CREATE TYPE "PermissionEnum" AS ENUM ('CREATE', 'EDIT', 'POST', 'DELETE');

-- CreateEnum
CREATE TYPE "ReactionEnum" AS ENUM ('LIKE', 'DISLIKE');

-- DropForeignKey
ALTER TABLE "_Subscribe" DROP CONSTRAINT "_Subscribe_A_fkey";

-- DropForeignKey
ALTER TABLE "_Subscribe" DROP CONSTRAINT "_Subscribe_B_fkey";

-- AlterTable
ALTER TABLE "ChannelAdmin" DROP COLUMN "role",
ADD COLUMN     "roleName" "AdminRoleEnum" NOT NULL;

-- AlterTable
ALTER TABLE "Video" ADD COLUMN     "reactionId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_Subscribe";

-- CreateTable
CREATE TABLE "ChannelSubscriber" (
    "id" SERIAL NOT NULL,
    "channelId" INTEGER NOT NULL,

    CONSTRAINT "ChannelSubscriber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelLevel" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "channelSubscriberId" INTEGER NOT NULL,

    CONSTRAINT "ChannelLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Benefit" (
    "id" SERIAL NOT NULL,
    "benefit" "BenefitEnum" NOT NULL,

    CONSTRAINT "Benefit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" SERIAL NOT NULL,
    "permission" "PermissionEnum" NOT NULL,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reaction" (
    "id" SERIAL NOT NULL,
    "type" "ReactionEnum" NOT NULL,
    "videoId" INTEGER NOT NULL,

    CONSTRAINT "Reaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ChannelSubscriberToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_BenefitToChannelLevel" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ChannelAdminToPermission" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ReactionToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ChannelSubscriberToUser_AB_unique" ON "_ChannelSubscriberToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ChannelSubscriberToUser_B_index" ON "_ChannelSubscriberToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BenefitToChannelLevel_AB_unique" ON "_BenefitToChannelLevel"("A", "B");

-- CreateIndex
CREATE INDEX "_BenefitToChannelLevel_B_index" ON "_BenefitToChannelLevel"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ChannelAdminToPermission_AB_unique" ON "_ChannelAdminToPermission"("A", "B");

-- CreateIndex
CREATE INDEX "_ChannelAdminToPermission_B_index" ON "_ChannelAdminToPermission"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ReactionToUser_AB_unique" ON "_ReactionToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ReactionToUser_B_index" ON "_ReactionToUser"("B");

-- AddForeignKey
ALTER TABLE "ChannelSubscriber" ADD CONSTRAINT "ChannelSubscriber_channelId_fkey" FOREIGN KEY ("channelId") REFERENCES "Channel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelLevel" ADD CONSTRAINT "ChannelLevel_channelSubscriberId_fkey" FOREIGN KEY ("channelSubscriberId") REFERENCES "ChannelSubscriber"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES "Video"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelSubscriberToUser" ADD CONSTRAINT "_ChannelSubscriberToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "ChannelSubscriber"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelSubscriberToUser" ADD CONSTRAINT "_ChannelSubscriberToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BenefitToChannelLevel" ADD CONSTRAINT "_BenefitToChannelLevel_A_fkey" FOREIGN KEY ("A") REFERENCES "Benefit"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BenefitToChannelLevel" ADD CONSTRAINT "_BenefitToChannelLevel_B_fkey" FOREIGN KEY ("B") REFERENCES "ChannelLevel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelAdminToPermission" ADD CONSTRAINT "_ChannelAdminToPermission_A_fkey" FOREIGN KEY ("A") REFERENCES "ChannelAdmin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelAdminToPermission" ADD CONSTRAINT "_ChannelAdminToPermission_B_fkey" FOREIGN KEY ("B") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReactionToUser" ADD CONSTRAINT "_ReactionToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Reaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReactionToUser" ADD CONSTRAINT "_ReactionToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
