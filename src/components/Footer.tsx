import { Container, Flex, Link, Text } from '@chakra-ui/react';

export default function Footer(props) {
    return (
        <Container maxWidth="container.lg">
            <Flex mt="auto" alignItems="center" justifyContent="space-between" textAlign="center" px="12" color="gray.500" height="16" {...props} fontSize="sm">
                <Text fontWeight="500">
                    🔌 API Proxy Server is open source on
                    {' '}
                    <Link href="https://github.com/mohsin-shaikh/api-proxy-server" fontWeight="500" color="green.400" isExternal>GitHub</Link>
                </Text>
                <Text mt="1">
                    Made in 🇮🇳 by <Link href="https://github.com/mohsin-shaikh" fontWeight="500" color="green.400" isExternal>Mohsin Shaikh</Link>
                </Text>
            </Flex>
        </Container>
    );
}
