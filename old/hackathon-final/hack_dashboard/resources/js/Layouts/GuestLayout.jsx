import ApplicationLogo from "@/Components/ApplicationLogo";
import { Link } from "@inertiajs/react";

export default function Guest({ children }) {
    return (
        <div
            className="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0"
            style={{
                background:
                    "url('https://www.datocms-assets.com/33016/1608761592-home-hero-1.jpg')",
                backgroundRepeat: "no-repeat",
                backgroundPosition: "center",
            }}
        >
            <div>
                <Link href="/">
                    <ApplicationLogo className="w-36 h-36 fill-white text-gray-500" />
                </Link>
            </div>

            <div className="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                {children}
            </div>
        </div>
    );
}
