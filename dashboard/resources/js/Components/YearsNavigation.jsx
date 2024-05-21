import React from "react";
import { Link, usePage } from "@inertiajs/react";

export default function YearsNavigation({ availableYears }) {
    const { url } = usePage();

    return (
        <div>
            <Link
                replace
                preserveScroll
                // preserveState
                href={`?year=`}
                className={`cursor-pointer mx-1 inline-flex items-center px-4 py-2 border  rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150  ${
                    url.endsWith("=") || !url.includes("?year=")
                        ? "bg-amber-800 hover:bg-amber-900 border-amber-800 text-white"
                        : "bg-white hover:bg-gray-50 border-gray-300 text-gray-700"
                }`}
            >
                All
            </Link>
            {Boolean(availableYears.length) &&
                availableYears.map((year) => (
                    <Link
                        key={year}
                        replace
                        preserveScroll
                        // preserveState
                        href={`?year=${year}`}
                        className={`cursor-pointer mx-1 inline-flex items-center px-4 py-2 border  rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150  ${
                            url.includes(`?year=${year}`)
                                ? "bg-amber-800 hover:bg-amber-900 border-amber-800 text-white"
                                : "bg-white hover:bg-gray-50 border-gray-300 text-gray-700"
                        }`}
                    >
                        {year}
                    </Link>
                ))}
        </div>
    );
}
