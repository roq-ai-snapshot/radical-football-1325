-- CreateTable
CREATE TABLE "academy" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "image" VARCHAR(255),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" UUID NOT NULL,
    "tenant_id" VARCHAR(255) NOT NULL,

    CONSTRAINT "academy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parent_access_request" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "parent_id" UUID NOT NULL,
    "player_id" UUID NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "parent_access_request_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "performance_evaluation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "player_id" UUID NOT NULL,
    "coach_id" UUID NOT NULL,
    "academy_id" UUID NOT NULL,
    "date" DATE NOT NULL,
    "evaluation" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "performance_evaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "player_profile" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "coach_id" UUID NOT NULL,
    "academy_id" UUID NOT NULL,
    "personal_information" VARCHAR(255),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "player_profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "training_session" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "player_id" UUID NOT NULL,
    "coach_id" UUID NOT NULL,
    "academy_id" UUID NOT NULL,
    "date" DATE NOT NULL,
    "description" VARCHAR(255),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "training_session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "email" VARCHAR(255) NOT NULL,
    "firstName" VARCHAR(255),
    "lastName" VARCHAR(255),
    "roq_user_id" VARCHAR(255) NOT NULL,
    "tenant_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "academy" ADD CONSTRAINT "academy_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parent_access_request" ADD CONSTRAINT "parent_access_request_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parent_access_request" ADD CONSTRAINT "parent_access_request_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "performance_evaluation" ADD CONSTRAINT "performance_evaluation_academy_id_fkey" FOREIGN KEY ("academy_id") REFERENCES "academy"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "performance_evaluation" ADD CONSTRAINT "performance_evaluation_coach_id_fkey" FOREIGN KEY ("coach_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "performance_evaluation" ADD CONSTRAINT "performance_evaluation_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player_profile" ADD CONSTRAINT "player_profile_academy_id_fkey" FOREIGN KEY ("academy_id") REFERENCES "academy"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player_profile" ADD CONSTRAINT "player_profile_coach_id_fkey" FOREIGN KEY ("coach_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player_profile" ADD CONSTRAINT "player_profile_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "training_session" ADD CONSTRAINT "training_session_academy_id_fkey" FOREIGN KEY ("academy_id") REFERENCES "academy"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "training_session" ADD CONSTRAINT "training_session_coach_id_fkey" FOREIGN KEY ("coach_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "training_session" ADD CONSTRAINT "training_session_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

