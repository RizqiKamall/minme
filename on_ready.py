from nextcord.ext import commands
import yaml
import sys
import nextcord
import requests
import json
import asyncio


class OnReady(commands.Cog):
    with open("./configs/config.yaml", "r", encoding="utf8") as file:
        data = yaml.safe_load(file)

    def __init__(self, bot):
        self.bot = bot
        self.previous_online_users = None
        self.bg_task = None

    @commands.Cog.listener()
    async def on_ready(self):
        from ui import (
            Verification as VerificationView,
            GrowID as GrowIDView,
        )

        self.bot.add_view(VerificationView())
        self.bot.add_view(GrowIDView(self.bot))
        
        # Mulai tugas latar belakang untuk memperbarui status
        self.bg_task = self.bot.loop.create_task(self.status_update_task())
        
        print(f"bot is online as {self.bot.user}")
        print(f'successfully connected to {self.data["mongodb_url"]}')

    async def get_growtopia_status(self):
        # Konfigurasi proxy
        proxy_username = "g105992835340341331451"
        proxy_password = "GoLxRpWW95"
        proxy_host = "204.242.1.238"
        proxy_port = "11718"
        
        proxies = {
            'http': f'socks5://{proxy_username}:{proxy_password}@{proxy_host}:{proxy_port}',
            'https': f'socks5://{proxy_username}:{proxy_password}@{proxy_host}:{proxy_port}'
        }
        
        try:
            url = "https://growtopiagame.com/detail"
            response = requests.get(
                url, 
                proxies=proxies,
                timeout=30,
                verify=False
            )
            data = json.loads(response.text)
            online_users = int(data['online_user'])
            
            # Perbarui status dengan jumlah pemain online
            status_text = f"{online_users:,} players online"
            
            await self.bot.change_presence(
                status=nextcord.Status.online,
                activity=nextcord.Activity(
                    type=nextcord.ActivityType.watching,
                    name=status_text,
                ),
            )
            
            self.previous_online_users = online_users
            
        except Exception as e:
            print(f"Error mendapatkan status Growtopia: {e}")
            # Atur status default jika terjadi kesalahan
            await self.bot.change_presence(
                status=nextcord.Status.online,
                activity=nextcord.Activity(
                    type=nextcord.ActivityType.watching,
                    name="Growtopia Players",
                ),
            ),

    async def status_update_task(self):
        await self.bot.wait_until_ready()
        while not self.bot.is_closed():
            await self.get_growtopia_status()
            await asyncio.sleep(60)  # Perbarui setiap menit


def setup(bot):
    bot.add_cog(OnReady(bot))
