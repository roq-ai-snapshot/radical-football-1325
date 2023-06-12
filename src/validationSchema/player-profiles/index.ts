import * as yup from 'yup';

export const playerProfileValidationSchema = yup.object().shape({
  personal_information: yup.string(),
  user_id: yup.string().nullable().required(),
  coach_id: yup.string().nullable().required(),
  academy_id: yup.string().nullable().required(),
});
