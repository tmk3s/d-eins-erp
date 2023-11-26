import { ApolloClient, InMemoryCache, createHttpLink, ServerError } from "@apollo/client";
import { onError } from "@apollo/client/link/error";
import { setContext } from '@apollo/client/link/context';
import { from } from "@apollo/client/core";
import { useRouter } from 'next/navigation'

const authLink = setContext((_, { headers }) => {
  console.log('AAA1')
  // get the authentication token from local storage if it exists
  const token:{[key: string]: string | null;} = {};
  token['access-token'] = localStorage.getItem('accessToken');
  const uid = localStorage.getItem('uid');
  const client = localStorage.getItem('client');
  const expiry = localStorage.getItem('expiry');
  // return the headers to the context so httpLink can read them
  return {
    headers: {
      ...headers,
      ...token,
      uid: uid,
      client: client,
      expiry: expiry,
      authorization: token ? `Bearer ${token}` : "",
    }
  }
});

const httpLink = createHttpLink({
  uri: 'graphql',
});

// https://zenn.dev/konboi/articles/89263019f68781
const logoutLink = onError(({  graphQLErrors, networkError, operation, forward }) => {
  console.log('AA2')
  // const router = useRouter();
  if (networkError?.name === 'ServerError') {
    const serverErrorStatusCode = (networkError as ServerError).statusCode
    if (serverErrorStatusCode === 401) window.location.href ='/sign_in';
  }
})

// https://www.apollographql.com/docs/react/networking/advanced-http-networking/
export const client = new ApolloClient({
  uri: "/graphql",
  cache: new InMemoryCache(),
  link: from([authLink, logoutLink, httpLink]), // 順番大事
});