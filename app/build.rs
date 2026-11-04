// Embeds icon/tsuba.ico in tsuba.exe, so Explorer, the Start menu and the taskbar show it.
fn main() {
    println!("cargo:rerun-if-changed=icon/tsuba.ico");
    println!("cargo:rerun-if-changed=tsuba.rc");
    if std::env::var("CARGO_CFG_TARGET_OS").as_deref() == Ok("windows") {
        embed_resource::compile("tsuba.rc", embed_resource::NONE).manifest_optional().unwrap();
    }
}
