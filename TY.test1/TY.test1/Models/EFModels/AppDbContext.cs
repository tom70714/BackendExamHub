﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TY.test1.Models.ViewModels;

namespace TY.test1.Models.EFModels;

public partial class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<MyofficeAcpd> MyofficeAcpds { get; set; }

    public virtual DbSet<MyofficeExcuteionLog> MyofficeExcuteionLogs { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MyofficeAcpd>(entity =>
        {
            entity.HasKey(e => e.AcpdSid);

            entity.ToTable("Myoffice_ACPD");

            entity.Property(e => e.AcpdSid)
                .HasMaxLength(20)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("acpd_sid");
            entity.Property(e => e.AcpdCname)
                .IsRequired()
                .HasMaxLength(60)
                .HasColumnName("acpd_cname");
            entity.Property(e => e.AcpdEmail)
                .IsRequired()
                .HasMaxLength(60)
                .HasColumnName("acpd_email");
            entity.Property(e => e.AcpdEname)
                .IsRequired()
                .HasMaxLength(40)
                .HasColumnName("acpd_ename");
            entity.Property(e => e.AcpdLoginId)
                .IsRequired()
                .HasMaxLength(30)
                .HasColumnName("acpd_LoginID");
            entity.Property(e => e.AcpdLoginPw)
                .IsRequired()
                .HasMaxLength(60)
                .HasColumnName("acpd_LoginPW");
            entity.Property(e => e.AcpdMemo)
                .HasMaxLength(120)
                .HasColumnName("acpd_memo");
            entity.Property(e => e.AcpdNowdatetime)
                .HasColumnType("datetime")
                .HasColumnName("acpd_nowdatetime");
            entity.Property(e => e.AcpdSname)
                .IsRequired()
                .HasMaxLength(40)
                .HasColumnName("acpd_sname");
            entity.Property(e => e.AcpdStatus).HasColumnName("acpd_status");
            entity.Property(e => e.AcpdStop).HasColumnName("acpd_stop");
            entity.Property(e => e.AcpdStopMemo)
                .HasMaxLength(600)
                .HasColumnName("acpd_stopMemo");
            entity.Property(e => e.AcpdUpddatetitme)
                .HasColumnType("datetime")
                .HasColumnName("acpd_upddatetitme");
            entity.Property(e => e.AcpdUpdid)
                .IsRequired()
                .HasMaxLength(20)
                .HasColumnName("acpd_updid");
            entity.Property(e => e.AppdNowid)
                .IsRequired()
                .HasMaxLength(20)
                .HasColumnName("appd_nowid");
        });

        modelBuilder.Entity<MyofficeExcuteionLog>(entity =>
        {
            entity.HasKey(e => e.DeLogAuthId);

            entity.ToTable("Myoffice_ExcuteionLog");

            entity.Property(e => e.DeLogAuthId).HasColumnName("DeLog_AuthID");
            entity.Property(e => e.DeLogExecuteionInfo)
                .IsRequired()
                .HasColumnName("DeLog_ExecuteionInfo");
            entity.Property(e => e.DeLogExecutionProgram)
                .IsRequired()
                .HasMaxLength(120)
                .HasColumnName("DeLog_ExecutionProgram");
            entity.Property(e => e.DeLogGroupId).HasColumnName("DeLog_GroupID");
            entity.Property(e => e.DeLogIsCustomDebug).HasColumnName("DeLog_isCustomDebug");
            entity.Property(e => e.DeLogStoredPrograms)
                .IsRequired()
                .HasMaxLength(120)
                .HasColumnName("DeLog_StoredPrograms");
            entity.Property(e => e.DeLogVerifyNeeded).HasColumnName("DeLog_VerifyNeeded");
            entity.Property(e => e.ExelogNowdatetime)
                .HasColumnType("datetime")
                .HasColumnName("exelog_nowdatetime");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

public DbSet<TY.test1.Models.ViewModels.User> User { get; set; } = default!;
}