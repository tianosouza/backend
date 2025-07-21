/*
  Warnings:

  - The `role` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "condominiumId" TEXT,
DROP COLUMN "role",
ADD COLUMN     "role" "Roles" NOT NULL DEFAULT 'USER';

-- CreateTable
CREATE TABLE "Condominium" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "syndicId" TEXT,

    CONSTRAINT "Condominium_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Condominium_syndicId_key" ON "Condominium"("syndicId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_condominiumId_fkey" FOREIGN KEY ("condominiumId") REFERENCES "Condominium"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Condominium" ADD CONSTRAINT "Condominium_syndicId_fkey" FOREIGN KEY ("syndicId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
