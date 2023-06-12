import AppLayout from 'layout/app-layout';
import React, { useState } from 'react';
import {
  FormControl,
  FormLabel,
  Input,
  Button,
  Text,
  Box,
  Spinner,
  FormErrorMessage,
  Switch,
  NumberInputStepper,
  NumberDecrementStepper,
  NumberInputField,
  NumberIncrementStepper,
  NumberInput,
} from '@chakra-ui/react';
import { useFormik, FormikHelpers } from 'formik';
import * as yup from 'yup';
import DatePicker from 'react-datepicker';
import { useRouter } from 'next/router';
import { createPlayerProfile } from 'apiSdk/player-profiles';
import { Error } from 'components/error';
import { playerProfileValidationSchema } from 'validationSchema/player-profiles';
import { AsyncSelect } from 'components/async-select';
import { ArrayFormField } from 'components/array-form-field';
import { AccessOperationEnum, AccessServiceEnum, withAuthorization } from '@roq/nextjs';
import { UserInterface } from 'interfaces/user';
import { AcademyInterface } from 'interfaces/academy';
import { getUsers } from 'apiSdk/users';
import { getAcademies } from 'apiSdk/academies';
import { PlayerProfileInterface } from 'interfaces/player-profile';

function PlayerProfileCreatePage() {
  const router = useRouter();
  const [error, setError] = useState(null);

  const handleSubmit = async (values: PlayerProfileInterface, { resetForm }: FormikHelpers<any>) => {
    setError(null);
    try {
      await createPlayerProfile(values);
      resetForm();
      router.push('/player-profiles');
    } catch (error) {
      setError(error);
    }
  };

  const formik = useFormik<PlayerProfileInterface>({
    initialValues: {
      personal_information: '',
      user_id: (router.query.user_id as string) ?? null,
      coach_id: (router.query.coach_id as string) ?? null,
      academy_id: (router.query.academy_id as string) ?? null,
    },
    validationSchema: playerProfileValidationSchema,
    onSubmit: handleSubmit,
    enableReinitialize: true,
    validateOnChange: false,
    validateOnBlur: false,
  });

  return (
    <AppLayout>
      <Box bg="white" p={4} rounded="md" shadow="md">
        <Box mb={4}>
          <Text as="h1" fontSize="2xl" fontWeight="bold">
            Create Player Profile
          </Text>
        </Box>
        {error && (
          <Box mb={4}>
            <Error error={error} />
          </Box>
        )}
        <form onSubmit={formik.handleSubmit}>
          <FormControl id="personal_information" mb="4" isInvalid={!!formik.errors?.personal_information}>
            <FormLabel>Personal Information</FormLabel>
            <Input
              type="text"
              name="personal_information"
              value={formik.values?.personal_information}
              onChange={formik.handleChange}
            />
            {formik.errors.personal_information && (
              <FormErrorMessage>{formik.errors?.personal_information}</FormErrorMessage>
            )}
          </FormControl>
          <AsyncSelect<UserInterface>
            formik={formik}
            name={'user_id'}
            label={'Select User'}
            placeholder={'Select User'}
            fetcher={getUsers}
            renderOption={(record) => (
              <option key={record.id} value={record.id}>
                {record?.email}
              </option>
            )}
          />
          <AsyncSelect<UserInterface>
            formik={formik}
            name={'coach_id'}
            label={'Select User'}
            placeholder={'Select User'}
            fetcher={getUsers}
            renderOption={(record) => (
              <option key={record.id} value={record.id}>
                {record?.email}
              </option>
            )}
          />
          <AsyncSelect<AcademyInterface>
            formik={formik}
            name={'academy_id'}
            label={'Select Academy'}
            placeholder={'Select Academy'}
            fetcher={getAcademies}
            renderOption={(record) => (
              <option key={record.id} value={record.id}>
                {record?.name}
              </option>
            )}
          />
          <Button isDisabled={formik?.isSubmitting} colorScheme="blue" type="submit" mr="4">
            Submit
          </Button>
        </form>
      </Box>
    </AppLayout>
  );
}

export default withAuthorization({
  service: AccessServiceEnum.PROJECT,
  entity: 'player_profile',
  operation: AccessOperationEnum.CREATE,
})(PlayerProfileCreatePage);
