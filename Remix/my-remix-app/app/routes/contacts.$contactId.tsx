import { json, type LoaderFunctionArgs } from "@remix-run/node";
// existing imports
import { getContact } from "../data";
import invariant from "tiny-invariant";
import { useLoaderData } from "@remix-run/react";

export const loader = async ({ params }: LoaderFunctionArgs) => {
  invariant(params.contactId, "Missing contactId param");
  const contact = await getContact(params.contactId);
  if (!contact) {
    throw new Response("Not Found", { status: 404 });
  }
  return json({ contact });
};

export default function ContactComponent() {
  const { contact } = useLoaderData<typeof loader>();
  if (!contact) {
    return <p>Loading...</p>;
  }
  return (
    <div id="contact">
      <div>
        {contact.id}
        <img
          alt={`${contact.first} ${contact.last} avatar`}
          key={contact.avatar}
          src={contact.avatar}
        />
      </div>
    </div>
  );
}
// existing code
