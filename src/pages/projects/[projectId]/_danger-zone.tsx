import { Box, Flex, Button } from '@chakra-ui/react';
import { TrashIcon } from '@heroicons/react/24/outline';
import { SectionHeading } from '@/components';
import { useState } from 'react';

export const getServerSideProps = () => ({ props: {} });

type Props = {
  onDelete: Function;
  buttonText: string;
  children?: React.ReactNode;
  [key: string]: any;
};

export default function DangerZone({ onDelete, buttonText, children, ...props }: Props) {
  const [deleting, setDeleting] = useState(false);

  const deleteHandler = async () => {
    if (deleting) return;

    try {
      setDeleting(true);
      await onDelete();
    } finally {
      setDeleting(false);
    }
  };

  return (
    <Box {...props}>
      <Flex justifyContent="space-between">
        <SectionHeading heading="🚨 Danger zone">
          {children}
        </SectionHeading>
        <Button
          colorScheme="red"
          color="red.500"
          variant="outline"
          rightIcon={<TrashIcon width={16} />}
          onClick={deleteHandler}
          isLoading={deleting}
        >
          {buttonText}
        </Button>
      </Flex>
    </Box>
  )
}
