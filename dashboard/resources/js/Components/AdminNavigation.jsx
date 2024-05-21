import React from "react";
import { Link } from "@inertiajs/react";

export default function AdminNavigation({ user }) {
    const isRoot = user.roles.find((role) => role.name === "root");
    return (
        <>
            {Boolean(isRoot) && (
                <>
                    <Link
                        href={route("admin.products.index")}
                        className={`cursor-pointer mx-1 inline-flex items-center px-4 py-2 border  rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150  ${
                            route().current("admin.products.index")
                                ? "bg-amber-800 hover:bg-amber-900 border-amber-800 text-white"
                                : "bg-white hover:bg-gray-50 border-gray-300 text-gray-700"
                        }`}
                    >
                        Products
                    </Link>
                    <Link
                        href={route("admin.stores.index")}
                        className={`cursor-pointer mx-1 inline-flex items-center px-4 py-2 border  rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150  ${
                            route().current("admin.stores.index")
                                ? "bg-amber-800 hover:bg-amber-900 border-amber-800 text-white"
                                : "bg-white hover:bg-gray-50 border-gray-300 text-gray-700"
                        }`}
                    >
                        Stores
                    </Link>
                </>
            )}
        </>
    );
}
